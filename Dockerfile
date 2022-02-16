# Railsに必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

# 以下の公式サイトの記述では、node.jsのバージョンが低くてbootstrapが使えない
# RUN apt-get update -qq && apt-get install -y nodejs