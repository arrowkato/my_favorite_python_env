FROM ubuntu:22.10

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends locales tzdata

# 日本語設定
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# root 以外の一般ユーザをつくる
ENV USER=ubuntu GROUP=ubuntu
ENV HOME=/home/$USER
RUN groupadd -r $GROUP \
    && useradd --create-home --no-log-init -r -s /bin/bash -u 1001 -g $GROUP $USER

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    # pyenv 用にインストール
    make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev ca-certificates \
    # git 関連
    git ssh git-secrets \
    # よく使うツール
    vim less zip jq sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 一般ユーザに変更
USER $USER
# pyenv と poetry installのために一時的に /home/ubuntu で作業
WORKDIR $HOME

COPY --chown=${USER}:${GROUP} .bash_profile ./
RUN mkdir -p $HOME/.ssh \
    && ssh-keyscan github.com >> .ssh/known_hosts

# pyenv と poetry用の環境変数
ENV PYTHON_VERSION=3.10.8 \
    POETRY_VIRTUALENVS_IN_PROJECT=1
RUN curl https://pyenv.run | bash \
    # pyenv をインストールした直後に PATH を通さないと落ちる
    && . $HOME/.bash_profile \
    && pyenv install $PYTHON_VERSION \
    && pyenv global $PYTHON_VERSION \
    && pyenv rehash \
    # install poetry
    && curl -sSL https://install.python-poetry.org | python - \
    && rm -rf $HOME/.cache


WORKDIR /app

COPY pyproject.toml /app
COPY poetry.lock /app

# poetry install
RUN . $HOME/.bash_profile \
    && poetry install --no-root \
    && rm -f /app/pyproject.toml /app/poetry.lock
