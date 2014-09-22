# <a name="title"></a> Busser::RunnerPlugin::Pester

A [Busser](https://github.com/test-kitchen/busser) runner plugin for [Pester](https://github.com/pester/Pester)

## <a name="installation"></a> Installation and Setup

This does not work yet. The only way to currently use this is to manually
`rake build` this gem, install it, run `busser plugin install pester --force_postinstall`,
and then `busser test pester`. And don’t forget to set BUSSER_ROOT.

Once there is a gem, busser will be able to install it automatically.

## <a name="usage"></a> Usage

Please put test files into [COOKBOOK]/test/integration/[SUITES]/pester/

```
-- [COOKBOOK]
  `-- test
     `-- integration
        `-- default
           `-- pester
              `-- Your.Tests.ps1
```

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## <a name="authors"></a> Authors

Created and maintained by [Jay Mundrawala][author] (<jdmundrawala@gmail.com>)

## <a name="license"></a> License

Apache 2.0 (see [LICENSE][license])


[author]:           https://github.com/jdmundrawala
[issues]:           https://github.com/jdmundrawala/busser-pester/issues
[license]:          https://github.com/jdmundrawala/busser-pester/blob/master/LICENSE
[repo]:             https://github.com/jdmundrawala/busser-pester
