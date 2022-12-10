# Jets Project

This README would normally document whatever steps are necessary to get the application up and running.

Things you might want to cover:

* Dependencies
* Configuration
* Database setup
* How to run the test suite
* Deployment instructions


### list queues
```shell
bundle exec shoryuken sqs ls --endpoint=http://127.0.0.1:4576
```

### create queue
```shell
bundle exec shoryuken sqs create binance-price-update --endpoint=http://127.0.0.1:4576
```
