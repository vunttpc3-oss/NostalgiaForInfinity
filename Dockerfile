FROM freqtradeorg/freqtrade:stable

USER root

WORKDIR /freqtrade

COPY . /freqtrade

RUN mkdir -p \
    /freqtrade/user_data/data \
    /freqtrade/user_data/logs \
    /freqtrade/user_data/backtest_results \
    /freqtrade/user_data/hyperopt_results

RUN chown -R ftuser:ftuser /freqtrade

USER ftuser

ENV PYTHONUNBUFFERED=1
ENV TZ=Asia/Ho_Chi_Minh

CMD ["trade", "--config", "/freqtrade/config.json", "--strategy", "NostalgiaForInfinityX7", "--strategy-path", "/freqtrade"]
