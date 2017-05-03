# Sense Statsd

Takes data from your Hello Sense sensors and publishes them to a dogstatsd endpoint.

Currently hardcoded to emit to the `room:bedroom` tag. Just a side project, expect no support or movement.

## Usage

```
docker run --restart=unless-stopped -e SENSE_EMAIL=<email> SENSE_PASSWORD=<password> chendo/sense-statsd
```

## Contributing

1. Fork it ( https://github.com/chendo/sense/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [chendo](https://github.com/chendo) Jack Chen (chendo) - creator, maintainer
