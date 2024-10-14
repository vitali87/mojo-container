FROM ubuntu
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    vim \
    libedit2 \
    build-essential \
    libssl-dev \
    python3 \
    python3-pip \
    libffi-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libbz2-dev \
    gcc \
    g++ \
    libstdc++6
SHELL ["/bin/bash", "-c"]
RUN curl -ssL https://magic.modular.com/db2ad2ac-41cc-4f0b-bc22-e12bcc9ef412 | bash && \
    source /root/.bashrc && \
    export PATH=$PATH:/root/.modular/bin && \
    magic self-update

RUN BASHRC=$( [ -f "$HOME/.bash_profile" ] && echo "$HOME/.bash_profile" || echo "$HOME/.bashrc" ) && \
    echo 'eval "$(magic completion --shell bash)"' >> "$BASHRC" && \
    source "$BASHRC"

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
