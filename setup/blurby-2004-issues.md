# Blurby Ubuntu Server 20.04 issues

## Bower installation

```
Please note that,
    blurbmenu#bed858c5ca depends on jquery#~>1.8 which resolved to jquery#1.8.3+1
    blurb_ui#503696b8b0 depends on jquery#~>1.8.3 which resolved to jquery#1.8.3+1
    jquery-validation#1.13.1 depends on jquery#>= 1.6.4 which resolved to jquery#3.7.1
    jquery-ujs#1.0.3 depends on jquery#>1.8.* which resolved to jquery#3.7.1
    jquery.cookie#1.4.1 depends on jquery#>=1.2 which resolved to jquery#3.7.1
Resort to using jquery#~>1.8.3 which resolved to jquery#1.8.3+1
Code incompatibilities may occur.
```

# Security issues

NPM on Blurby
```
npm WARN notice [SECURITY] select2 has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=select2 - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] yargs-parser has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=yargs-parser - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] cross-spawn has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=cross-spawn - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] cross-spawn has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=cross-spawn - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] y18n has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=y18n - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] shelljs has the following vulnerabilities: 1 high, 1 moderate. Go here for more details: https://github.com/advisories?query=shelljs - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] react-dev-utils has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=react-dev-utils - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] cross-spawn has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=cross-spawn - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] websocket-extensions has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=websocket-extensions - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] webpack-dev-middleware has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=webpack-dev-middleware - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] express has the following vulnerabilities: 1 moderate, 1 low. Go here for more details: https://github.com/advisories?query=express - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] micromatch has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=micromatch - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] braces has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=braces - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] url-parse has the following vulnerabilities: 1 critical, 5 moderate. Go here for more details: https://github.com/advisories?query=url-parse - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] eventsource has the following vulnerability: 1 critical. Go here for more details: https://github.com/advisories?query=eventsource - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] ajv has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=ajv - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] html-minifier has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=html-minifier - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] body-parser has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=body-parser - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] underscore has the following vulnerability: 1 critical. Go here for more details: https://github.com/advisories?query=underscore - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] ua-parser-js has the following vulnerabilities: 4 high. Go here for more details: https://github.com/advisories?query=ua-parser-js - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] @babel/traverse has the following vulnerability: 1 critical. Go here for more details: https://github.com/advisories?query=%40babel%2Ftraverse - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] tree-kill has the following vulnerabilities: 1 critical, 1 high. Go here for more details: https://github.com/advisories?query=tree-kill - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] serve-static has the following vulnerability: 1 low. Go here for more details: https://github.com/advisories?query=serve-static - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] send has the following vulnerability: 1 low. Go here for more details: https://github.com/advisories?query=send - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] terser has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=terser - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] postcss has the following vulnerabilities: 2 moderate. Go here for more details: https://github.com/advisories?query=postcss - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] postcss has the following vulnerabilities: 2 moderate. Go here for more details: https://github.com/advisories?query=postcss - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] postcss has the following vulnerabilities: 2 moderate. Go here for more details: https://github.com/advisories?query=postcss - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] postcss has the following vulnerabilities: 2 moderate. Go here for more details: https://github.com/advisories?query=postcss - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] postcss has the following vulnerabilities: 2 moderate. Go here for more details: https://github.com/advisories?query=postcss - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] postcss has the following vulnerabilities: 2 moderate. Go here for more details: https://github.com/advisories?query=postcss - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] ssri has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=ssri - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] progressbar.js has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=progressbar.js - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] shell-quote has the following vulnerability: 1 critical. Go here for more details: https://github.com/advisories?query=shell-quote - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] merge-deep has the following vulnerability: 1 critical. Go here for more details: https://github.com/advisories?query=merge-deep - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] browserify-sign has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=browserify-sign - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] serialize-javascript has the following vulnerabilities: 1 high, 1 moderate. Go here for more details: https://github.com/advisories?query=serialize-javascript - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] browserslist has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=browserslist - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] browserslist has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=browserslist - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] semver has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=semver - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] node-fetch has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=node-fetch - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] loader-utils has the following vulnerabilities: 1 critical, 2 high. Go here for more details: https://github.com/advisories?query=loader-utils - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] json5 has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=json5 - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] qs has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=qs - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] postcss has the following vulnerabilities: 3 moderate. Go here for more details: https://github.com/advisories?query=postcss - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] path-parse has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=path-parse - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] path-to-regexp has the following vulnerabilities: 1 high, 1 moderate. Go here for more details: https://github.com/advisories?query=path-to-regexp - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] nth-check has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=nth-check - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] node-fetch has the following vulnerabilities: 1 high, 1 low. Go here for more details: https://github.com/advisories?query=node-fetch - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] nested-object-assign has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=nested-object-assign - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] fsevents has the following vulnerabilities: 2 critical. Go here for more details: https://github.com/advisories?query=fsevents - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] debug has the following vulnerability: 1 low. Go here for more details: https://github.com/advisories?query=debug - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] debug has the following vulnerability: 1 low. Go here for more details: https://github.com/advisories?query=debug - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] minimist has the following vulnerabilities: 1 critical, 1 moderate. Go here for more details: https://github.com/advisories?query=minimist - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] loader-utils has the following vulnerabilities: 1 critical, 2 high. Go here for more details: https://github.com/advisories?query=loader-utils - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] json5 has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=json5 - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] json5 has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=json5 - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] minimatch has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=minimatch - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] minimist has the following vulnerabilities: 1 critical, 1 moderate. Go here for more details: https://github.com/advisories?query=minimist - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] elliptic has the following vulnerabilities: 1 high, 1 moderate, 5 low. Go here for more details: https://github.com/advisories?query=elliptic - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] marked has the following vulnerabilities: 2 high, 1 moderate. Go here for more details: https://github.com/advisories?query=marked - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] lodash-es has the following vulnerabilities: 2 high, 1 moderate. Go here for more details: https://github.com/advisories?query=lodash-es - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] async has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=async - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] lodash has the following vulnerabilities: 2 high, 1 moderate. Go here for more details: https://github.com/advisories?query=lodash - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] kind-of has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=kind-of - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] jquery has the following vulnerabilities: 4 moderate. Go here for more details: https://github.com/advisories?query=jquery - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] ip has the following vulnerabilities: 1 high, 1 low. Go here for more details: https://github.com/advisories?query=ip - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] ini has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=ini - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] ansi-regex has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=ansi-regex - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] hosted-git-info has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=hosted-git-info - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] ejs has the following vulnerabilities: 1 critical, 1 moderate. Go here for more details: https://github.com/advisories?query=ejs - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] decode-uri-component has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=decode-uri-component - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] semver has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=semver - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] cookie has the following vulnerability: 1 low. Go here for more details: https://github.com/advisories?query=cookie - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] lodash has the following vulnerabilities: 1 critical, 2 high, 1 moderate. Go here for more details: https://github.com/advisories?query=lodash - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] ansi-regex has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=ansi-regex - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] ansi-html has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=ansi-html - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] acorn has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=acorn - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
```

issues on hemingway NPM
```
npm WARN notice [SECURITY] minimist has the following vulnerability: 1 critical. Go here for more details: https://github.com/advisories?query=minimist - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] qs has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=qs - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] select2 has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=select2 - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] nconf has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=nconf - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] yargs-parser has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=yargs-parser - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] request has the following vulnerabilities: 2 moderate. Go here for more details: https://github.com/advisories?query=request - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] y18n has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=y18n - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] ws has the following vulnerabilities: 1 high, 1 moderate. Go here for more details: https://github.com/advisories?query=ws - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] word-wrap has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=word-wrap - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] request has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=request - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] concat-stream has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=concat-stream - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] bl has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=bl - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] got has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=got - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] set-value has the following vulnerabilities: 1 critical, 1 high. Go here for more details: https://github.com/advisories?query=set-value - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] undefsafe has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=undefsafe - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] tunnel-agent has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=tunnel-agent - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] tree-kill has the following vulnerabilities: 1 critical, 1 high. Go here for more details: https://github.com/advisories?query=tree-kill - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] tough-cookie has the following vulnerabilities: 1 high, 2 moderate. Go here for more details: https://github.com/advisories?query=tough-cookie - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] js-yaml has the following vulnerabilities: 1 high, 1 moderate. Go here for more details: https://github.com/advisories?query=js-yaml - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] set-value has the following vulnerabilities: 1 critical, 1 high. Go here for more details: https://github.com/advisories?query=set-value - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] hawk has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=hawk - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] semver has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=semver - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] tough-cookie has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=tough-cookie - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] lodash has the following vulnerabilities: 1 high, 1 moderate. Go here for more details: https://github.com/advisories?query=lodash - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] micromatch has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=micromatch - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] braces has the following vulnerabilities: 1 high, 2 low. Go here for more details: https://github.com/advisories?query=braces - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] qs has the following vulnerabilities: 2 high. Go here for more details: https://github.com/advisories?query=qs - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] fsevents has the following vulnerabilities: 2 critical. Go here for more details: https://github.com/advisories?query=fsevents - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] mixin-deep has the following vulnerability: 1 critical. Go here for more details: https://github.com/advisories?query=mixin-deep - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] mem has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=mem - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] async has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=async - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] lodash.merge has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=lodash.merge - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] lodash-es has the following vulnerabilities: 2 high, 1 moderate. Go here for more details: https://github.com/advisories?query=lodash-es - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] lodash has the following vulnerabilities: 1 critical, 3 high, 2 moderate. Go here for more details: https://github.com/advisories?query=lodash - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] jsonpointer has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=jsonpointer - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] json-schema has the following vulnerability: 1 critical. Go here for more details: https://github.com/advisories?query=json-schema - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] qs has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=qs - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] dot-prop has the following vulnerability: 1 high. Go here for more details: https://github.com/advisories?query=dot-prop - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] hoek has the following vulnerabilities: 2 high. Go here for more details: https://github.com/advisories?query=hoek - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] tar has the following vulnerabilities: 5 high, 1 moderate. Go here for more details: https://github.com/advisories?query=tar - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] extend has the following vulnerability: 1 moderate. Go here for more details: https://github.com/advisories?query=extend - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
npm WARN notice [SECURITY] debug has the following vulnerabilities: 1 high, 1 low. Go here for more details: https://github.com/advisories?query=debug - Run `npm i npm@latest -g` to upgrade your npm version, and then `npm audit` to get more info.
```

# Unexpected dependency upgrades and updates
## package-lock.json - Blurby
git diff package-lock.json
```
diff --git a/package-lock.json b/package-lock.json
index a106a4a3ef..d6ffa9676b 100644
--- a/package-lock.json
+++ b/package-lock.json
@@ -914,9 +914,9 @@
       }
     },
     "@blurb/buildkit": {
-      "version": "1.3.33",
-      "resolved": "https://registry.npmjs.org/@blurb/buildkit/-/buildkit-1.3.33.tgz",
-      "integrity": "sha512-Mkd1Vfs8iHjlPvHlH53BCQgBPQOp6tiqpueydlcvz22OonbbjTQEfdyhLPfAReXuvjpYuoQ1iwZX4upB7+Uksw==",
+      "version": "1.5.26",
+      "resolved": "https://registry.npmjs.org/@blurb/buildkit/-/buildkit-1.5.26.tgz",
+      "integrity": "sha512-c8sFEVLqOlIeNg0oqpnJbZnAKrxHyIZevwi4obLSDVsZ4kT0IHCZhC1wCUeg/zDvIVPObmYPaXLJjN0N92IgWQ==",
       "requires": {
         "backbone": "1.4.0",
         "hyperform": "0.9.23",
@@ -926,25 +926,16 @@
         "underscore": "1.9.1"
       }
     },
-    "@blurb/fetch-service": {
-      "version": "4.46.134",
-      "resolved": "https://registry.npmjs.org/@blurb/fetch-service/-/fetch-service-4.46.134.tgz",
-      "integrity": "sha512-vs9VYLZWJs3Qm4l+XJHTWmjVinHo8EpZwOabbklNRKCY8ojh3A4Vq1F2fSg14zQBYARN7DMuycSNQFqZfGb+zQ==",
-      "requires": {
-        "@blurb/urls": "4.46.134",
-        "fetch-ponyfill": "6.1.0"
-      }
-    },
     "@blurb/reactkit": {
-      "version": "4.46.110",
-      "resolved": "https://registry.npmjs.org/@blurb/reactkit/-/reactkit-4.46.110.tgz",
-      "integrity": "sha512-QUBYVYMoBWamSIcnGBFp2TopTnfFMrEZ4MVJ/UnGcE+KgMIUZbardbHHAFfEpM+Mosei8q6VTEKmascPC1wzxQ==",
+      "version": "4.47.1",
+      "resolved": "https://registry.npmjs.org/@blurb/reactkit/-/reactkit-4.47.1.tgz",
+      "integrity": "sha512-sDuHpcdKsQ9VP6iQY1as1TTWbWquaMva3UDKfWg8CokBrkrREqWSqHTP+vmV7XE10VKgIPnVdlV1D/XOxHu38Q==",
       "requires": {
         "@babel/polyfill": "7.4.4",
         "@babel/runtime": "7.5.4",
-        "@blurb/buildkit": "1.3.11",
-        "@blurb/fetch-service": "4.46.134",
-        "@blurb/urls": "4.46.134",
+        "@blurb/buildkit": "1.5.26",
+        "@blurb/fetch-service": "4.63.0",
+        "@blurb/urls": "4.63.0",
         "@mygooder/react-slick": "0.15.4-0.0.2",
         "@storybook/addon-info": "4.1.18",
         "@storybook/addon-links": "4.1.18",
@@ -981,26 +972,22 @@
         "url-parse": "1.4.7"
       },
       "dependencies": {
-        "@blurb/buildkit": {
-          "version": "1.3.11",
-          "resolved": "https://registry.npmjs.org/@blurb/buildkit/-/buildkit-1.3.11.tgz",
-          "integrity": "sha512-eMOiG1xUXYaHzqLRs2PnYMeWVl+WtI+3lskSiM5uYPBSp5fCWo8x1Aty23Ijzngmakt+/hdTUYlambJh7DzK3Q==",
-          "requires": {
-            "backbone": "1.4.0",
-            "hyperform": "0.9.23",
-            "jquery": "2.2.4",
-            "jquery.ui.position": "1.11.4",
-            "js-cookie": "2.2.0",
-            "underscore": "1.9.1"
+        "@blurb/fetch-service": {
+          "version": "4.63.0",
+          "resolved": "https://registry.npmjs.org/@blurb/fetch-service/-/fetch-service-4.63.0.tgz",
+          "integrity": "sha512-ECqJLGLbxF7qLAgFRC+L0OazQgoHz94MqKfqGp8cU7GSgrDJ3iVM71BMkBi/JbbtJvSC7QBegZ5RoDkMvU3CtA==",
+          "requires": {
+            "@blurb/urls": "4.63.0",
+            "fetch-ponyfill": "6.1.0"
           }
+        },
+        "@blurb/urls": {
+          "version": "4.63.0",
+          "resolved": "https://registry.npmjs.org/@blurb/urls/-/urls-4.63.0.tgz",
+          "integrity": "sha512-cGNzFeOithxz9Iv4kkdhPwb+VeU7dvP5NGLKaIC8BlimJglLLg/rF72iBoybdaZPK2zukE4m7W/XHd9ttO9mFg=="
         }
       }
     },
-    "@blurb/urls": {
-      "version": "4.46.134",
-      "resolved": "https://registry.npmjs.org/@blurb/urls/-/urls-4.46.134.tgz",
-      "integrity": "sha512-1sgBq2r95z3bOds3dV4FtSz3wHcg+SB8XFCoR+vnNbBatrCyp+9IwG1ShR59N/MsFOYYQmozKyZmQ8cNOtlATA=="
-    },
     "@emotion/cache": {
       "version": "0.8.8",
       "resolved": "https://registry.npmjs.org/@emotion/cache/-/cache-0.8.8.tgz",
```

## package-lock.json Hemingway
```
diff --git a/package-lock.json b/package-lock.json
index 211cd4da..69a5cb8d 100644
--- a/package-lock.json
+++ b/package-lock.json
@@ -9,7 +9,7 @@
       "resolved": "https://registry.npmjs.org/@babel/runtime/-/runtime-7.11.2.tgz",
       "integrity": "sha512-TeWkU52so0mPtDcaCTxNBI/IHiz0pZgr8VEFqXFtZWpYD08ZB6FaSwVAS8MKRQAP3bYKiVjwysOJgMFY28o6Tw==",
       "requires": {
-        "regenerator-runtime": "^0.13.4"
+        "regenerator-runtime": "0.13.7"
       },
       "dependencies": {
         "regenerator-runtime": {
@@ -24,36 +24,36 @@
       "resolved": "https://registry.npmjs.org/@blurb/reactkit/-/reactkit-3.0.2.tgz",
       "integrity": "sha512-ry+UJZh/ZQURmNxwxFYsdjzPpGHX0CFPKFtvxBcHvzLJAs+V8Uml2ayjjhMoXKUlcwrgmo0w9YcCwPYlVukGJw==",
       "requires": {
-        "@mygooder/react-slick": "^0.15.4-0.0.2",
-        "babel-polyfill": "^6.26.0",
-        "babel-runtime": "^6.26.0",
-        "brace": "^0.11.0",
-        "chokidar": "^1.7.0",
-        "classnames": "^2.2.5",
-        "counterpart": "^0.18.4",
-        "css-mediaquery": "^0.1.2",
-        "findup-sync": "^2.0.0",
-        "fs-extra": "^4.0.2",
-        "harsh": "^1.5.1",
-        "isomorphic-fetch": "^2.2.1",
-        "jsdom": "^11.4.0",
-        "md5": "^2.2.1",
-        "minimist": "^1.2.0",
-        "mobx": "^3.3.1",
-        "mobx-react": "^4.3.4",
-        "numeral": "^2.0.6",
-        "prop-types": "^15.6.0",
-        "qs": "^6.5.1",
-        "raf": "^3.4.0",
-        "react": "^16.1.1",
-        "react-dom": "^16.1.1",
-        "react-redux": "^5.0.6",
-        "redux": "^3.7.2",
-        "redux-logger": "^3.0.6",
-        "redux-thunk": "^2.1.0",
-        "slick-carousel": "^1.8.1",
-        "source-map-support": "^0.5.0",
-        "url-parse": "^1.2.0"
+        "@mygooder/react-slick": "0.15.4-0.0.2",
+        "babel-polyfill": "6.26.0",
+        "babel-runtime": "6.26.0",
+        "brace": "0.11.1",
+        "chokidar": "1.7.0",
+        "classnames": "2.2.6",
+        "counterpart": "0.18.6",
+        "css-mediaquery": "0.1.2",
+        "findup-sync": "2.0.0",
+        "fs-extra": "4.0.3",
+        "harsh": "1.5.1",
+        "isomorphic-fetch": "2.2.1",
+        "jsdom": "11.12.0",
+        "md5": "2.3.0",
+        "minimist": "1.2.5",
+        "mobx": "3.6.2",
+        "mobx-react": "4.4.3",
+        "numeral": "2.0.6",
+        "prop-types": "15.7.2",
+        "qs": "6.9.4",
+        "raf": "3.4.1",
+        "react": "16.13.1",
+        "react-dom": "16.13.1",
+        "react-redux": "5.1.2",
+        "redux": "3.7.2",
+        "redux-logger": "3.0.6",
+        "redux-thunk": "2.3.0",
+        "slick-carousel": "1.8.1",
+        "source-map-support": "0.5.19",
+        "url-parse": "1.4.7"
       },
       "dependencies": {
         "anymatch": {
@@ -61,8 +61,8 @@
           "resolved": "https://registry.npmjs.org/anymatch/-/anymatch-1.3.2.tgz",
           "integrity": "sha512-0XNayC8lTHQ2OI8aljNCN3sSx6hsr/1+rlcDAotXJR7C1oZZHCNsfpbKwMjRA3Uqb5tF1Rae2oloTr4xpq+WjA==",
           "requires": {
-            "micromatch": "^2.1.5",
-            "normalize-path": "^2.0.0"
+            "micromatch": "2.3.11",
+            "normalize-path": "2.1.1"
           }
         },
         "arr-diff": {
@@ -70,7 +70,7 @@
           "resolved": "https://registry.npmjs.org/arr-diff/-/arr-diff-2.0.0.tgz",
           "integrity": "sha1-jzuCf5Vai9ZpaX5KQlasPOrjVs8=",
           "requires": {
-            "arr-flatten": "^1.0.1"
+            "arr-flatten": "1.1.0"
           }
         },
         "array-unique": {
@@ -83,9 +83,9 @@
           "resolved": "https://registry.npmjs.org/braces/-/braces-1.8.5.tgz",
           "integrity": "sha1-uneWLhLf+WnWt2cR6RS3N4V79qc=",
           "requires": {
-            "expand-range": "^1.8.1",
-            "preserve": "^0.2.0",
-            "repeat-element": "^1.1.2"
+            "expand-range": "1.8.2",
+            "preserve": "0.2.0",
+            "repeat-element": "1.1.3"
           }
         },
         "chokidar": {
@@ -93,15 +93,15 @@
           "resolved": "https://registry.npmjs.org/chokidar/-/chokidar-1.7.0.tgz",
           "integrity": "sha1-eY5ol3gVHIB2tLNg5e3SjNortGg=",
           "requires": {
-            "anymatch": "^1.3.0",
-            "async-each": "^1.0.0",
-            "fsevents": "^1.0.0",
-            "glob-parent": "^2.0.0",
-            "inherits": "^2.0.1",
-            "is-binary-path": "^1.0.0",
-            "is-glob": "^2.0.0",
-            "path-is-absolute": "^1.0.0",
-            "readdirp": "^2.0.0"
+            "anymatch": "1.3.2",
+            "async-each": "1.0.1",
+            "fsevents": "1.2.7",
+            "glob-parent": "2.0.0",
+            "inherits": "2.0.3",
+            "is-binary-path": "1.0.1",
+            "is-glob": "2.0.1",
+            "path-is-absolute": "1.0.1",
+            "readdirp": "2.2.1"
           }
         },
         "expand-brackets": {
@@ -109,7 +109,7 @@
           "resolved": "https://registry.npmjs.org/expand-brackets/-/expand-brackets-0.1.5.tgz",
           "integrity": "sha1-3wcoTjQqgHzXM6xa9yQR5YHRF3s=",
           "requires": {
-            "is-posix-bracket": "^0.1.0"
+            "is-posix-bracket": "0.1.1"
           }
         },
         "extglob": {
@@ -117,7 +117,7 @@
           "resolved": "https://registry.npmjs.org/extglob/-/extglob-0.3.2.tgz",
           "integrity": "sha1-Lhj/PS9JqydlzskCPwEdqo2DSaE=",
           "requires": {
-            "is-extglob": "^1.0.0"
+            "is-extglob": "1.0.0"
           }
         },
         "fs-extra": {
@@ -125,9 +125,9 @@
           "resolved": "https://registry.npmjs.org/fs-extra/-/fs-extra-4.0.3.tgz",
           "integrity": "sha512-q6rbdDd1o2mAnQreO7YADIxf/Whx4AHBiRf6d+/cVT8h44ss+lHgxf1FemcqDnQt9X3ct4McHr+JMGlYSsK7Cg==",
           "requires": {
-            "graceful-fs": "^4.1.2",
-            "jsonfile": "^4.0.0",
-            "universalify": "^0.1.0"
+            "graceful-fs": "4.1.11",
+            "jsonfile": "4.0.0",
+            "universalify": "0.1.2"
           }
         },
         "glob-parent": {
@@ -135,7 +135,7 @@
           "resolved": "https://registry.npmjs.org/glob-parent/-/glob-parent-2.0.0.tgz",
           "integrity": "sha1-gTg9ctsFT8zPUzbaqQLxgvbtuyg=",
           "requires": {
-            "is-glob": "^2.0.0"
+            "is-glob": "2.0.1"
           }
         },
         "is-extglob": {
@@ -148,7 +148,7 @@
           "resolved": "https://registry.npmjs.org/is-glob/-/is-glob-2.0.1.tgz",
           "integrity": "sha1-0Jb5JqPe1WAPP9/ZEZjLCIjC2GM=",
           "requires": {
-            "is-extglob": "^1.0.0"
+            "is-extglob": "1.0.0"
           }
         },
         "jsonfile": {
@@ -156,7 +156,7 @@
           "resolved": "https://registry.npmjs.org/jsonfile/-/jsonfile-4.0.0.tgz",
           "integrity": "sha1-h3Gq4HmbZAdrdmQPygWPnBDjPss=",
           "requires": {
-            "graceful-fs": "^4.1.6"
+            "graceful-fs": "4.1.11"
           }
         },
         "kind-of": {
@@ -164,7 +164,7 @@
           "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
           "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
           "requires": {
-            "is-buffer": "^1.1.5"
+            "is-buffer": "1.1.6"
           }
         },
         "micromatch": {
@@ -172,19 +172,19 @@
           "resolved": "https://registry.npmjs.org/micromatch/-/micromatch-2.3.11.tgz",
           "integrity": "sha1-hmd8l9FyCzY0MdBNDRUpO9OMFWU=",
           "requires": {
-            "arr-diff": "^2.0.0",
-            "array-unique": "^0.2.1",
-            "braces": "^1.8.2",
-            "expand-brackets": "^0.1.4",
-            "extglob": "^0.3.1",
-            "filename-regex": "^2.0.0",
-            "is-extglob": "^1.0.0",
-            "is-glob": "^2.0.1",
-            "kind-of": "^3.0.2",
-            "normalize-path": "^2.0.1",
-            "object.omit": "^2.0.0",
-            "parse-glob": "^3.0.4",
-            "regex-cache": "^0.4.2"
+            "arr-diff": "2.0.0",
+            "array-unique": "0.2.1",
+            "braces": "1.8.5",
+            "expand-brackets": "0.1.5",
+            "extglob": "0.3.2",
+            "filename-regex": "2.0.1",
+            "is-extglob": "1.0.0",
+            "is-glob": "2.0.1",
+            "kind-of": "3.2.2",
+            "normalize-path": "2.1.1",
+            "object.omit": "2.0.1",
+            "parse-glob": "3.0.4",
+            "regex-cache": "0.4.4"
           }
         },
         "minimist": {
@@ -197,7 +197,7 @@
           "resolved": "https://registry.npmjs.org/normalize-path/-/normalize-path-2.1.1.tgz",
           "integrity": "sha1-GrKLVW4Zg2Oowab35vogE3/mrtk=",
           "requires": {
-            "remove-trailing-separator": "^1.0.1"
+            "remove-trailing-separator": "1.1.0"
           }
         },
         "qs": {
@@ -212,12 +212,12 @@
       "resolved": "https://registry.npmjs.org/@mygooder/react-slick/-/react-slick-0.15.4-0.0.2.tgz",
       "integrity": "sha512-jI7vRZ1sKk5JXSiVpk1OxhUxdd3AUVAJJjJUMF66f6znfXwqvTOSDWMnXhrTRp2O2Rd+Dae21UigRbUyZGnLfA==",
       "requires": {
-        "can-use-dom": "^0.1.0",
-        "classnames": "^2.2.5",
-        "enquire.js": "^2.1.6",
-        "json2mq": "^0.2.0",
-        "object-assign": "^4.1.0",
-        "slick-carousel": "^1.6.0"
+        "can-use-dom": "0.1.0",
+        "classnames": "2.2.6",
+        "enquire.js": "2.1.6",
+        "json2mq": "0.2.0",
+        "object-assign": "4.1.1",
+        "slick-carousel": "1.8.1"
       }
     },
     "abab": {
@@ -241,8 +241,8 @@
       "resolved": "https://registry.npmjs.org/acorn-globals/-/acorn-globals-4.3.4.tgz",
       "integrity": "sha512-clfQEh21R+D0leSbUdWf3OcfqyaCSAQ8Ryq00bofSekfr9W8u1jyYZo6ir0xu9Gtcf7BjcHJpnbZH7JOCpP60A==",
       "requires": {
-        "acorn": "^6.0.1",
-        "acorn-walk": "^6.0.1"
+        "acorn": "6.4.1",
+        "acorn-walk": "6.2.0"
       },
       "dependencies": {
         "acorn": {
@@ -262,10 +262,10 @@
       "resolved": "https://registry.npmjs.org/ajv/-/ajv-6.12.5.tgz",
       "integrity": "sha512-lRF8RORchjpKG50/WFf8xmg7sgCLFiYNNnqdKflk63whMQcWR5ngGjiSXkL9bjxy6B2npOK2HSMN49jEBMSkag==",
       "requires": {
-        "fast-deep-equal": "^3.1.1",
-        "fast-json-stable-stringify": "^2.0.0",
-        "json-schema-traverse": "^0.4.1",
-        "uri-js": "^4.2.2"
+        "fast-deep-equal": "3.1.3",
+        "fast-json-stable-stringify": "2.1.0",
+        "json-schema-traverse": "0.4.1",
+        "uri-js": "4.4.0"
       }
     },
     "ansi-align": {
@@ -274,7 +274,7 @@
       "integrity": "sha1-w2rsy6VjuJzrVW82kPCx2eNUf38=",
       "dev": true,
       "requires": {
-        "string-width": "^2.0.0"
+        "string-width": "2.1.1"
       },
       "dependencies": {
         "ansi-regex": {
@@ -295,8 +295,8 @@
           "integrity": "sha512-nOqH59deCq9SRHlxq1Aw85Jnt4w6KvLKqWVik6oA9ZklXLNIOlqg4F2yrT1MVaTjAqvVwdfeZ7w7aCvJD7ugkw==",
           "dev": true,
           "requires": {
-            "is-fullwidth-code-point": "^2.0.0",
-            "strip-ansi": "^4.0.0"
+            "is-fullwidth-code-point": "2.0.0",
+            "strip-ansi": "4.0.0"
           }
         },
         "strip-ansi": {
@@ -305,7 +305,7 @@
           "integrity": "sha1-qEeQIusaw2iocTibY1JixQXuNo8=",
           "dev": true,
           "requires": {
-            "ansi-regex": "^3.0.0"
+            "ansi-regex": "3.0.0"
           }
         }
       }
@@ -328,8 +328,8 @@
       "integrity": "sha512-5teOsQWABXHHBFP9y3skS5P3d/WfWXpv3FUpy+LorMrNYaT9pI4oLMQX7jzQ2KklNpGpWHzdCXTDT2Y3XGlZBw==",
       "dev": true,
       "requires": {
-        "micromatch": "^3.1.4",
-        "normalize-path": "^2.1.1"
+        "micromatch": "3.1.10",
+        "normalize-path": "2.1.1"
       },
       "dependencies": {
         "normalize-path": {
@@ -338,7 +338,7 @@
           "integrity": "sha1-GrKLVW4Zg2Oowab35vogE3/mrtk=",
           "dev": true,
           "requires": {
-            "remove-trailing-separator": "^1.0.1"
+            "remove-trailing-separator": "1.1.0"
           }
         }
       }
@@ -349,7 +349,7 @@
       "integrity": "sha512-o5Roy6tNG4SL/FOkCAN6RzjiakZS25RLYFrcMttJqbdd8BWrnA+fGz57iN5Pb06pvBGvl5gQ0B48dJlslXvoTg==",
       "dev": true,
       "requires": {
-        "sprintf-js": "~1.0.2"
+        "sprintf-js": "1.0.3"
       }
     },
     "arr-diff": {
@@ -399,7 +399,7 @@
       "integrity": "sha512-fNEiL2+AZt6AlAw/29Cr0UDe4sRAHCpEHh54WMz+Bb7QfNcFw4h3loofyJpLeQs4Yx7yuqu/2dLgM5hKOs6HlQ==",
       "dev": true,
       "requires": {
-        "lodash": "^4.17.10"
+        "lodash": "4.17.10"
       }
     },
     "async-each": {
@@ -438,9 +438,9 @@
       "resolved": "https://registry.npmjs.org/babel-polyfill/-/babel-polyfill-6.26.0.tgz",
       "integrity": "sha1-N5k3q8Z9eJWXCtxiHyhM2WbPIVM=",
       "requires": {
-        "babel-runtime": "^6.26.0",
-        "core-js": "^2.5.0",
-        "regenerator-runtime": "^0.10.5"
+        "babel-runtime": "6.26.0",
+        "core-js": "2.6.11",
+        "regenerator-runtime": "0.10.5"
       }
     },
     "babel-runtime": {
@@ -448,8 +448,8 @@
       "resolved": "https://registry.npmjs.org/babel-runtime/-/babel-runtime-6.26.0.tgz",
       "integrity": "sha1-llxwWGaOgrVde/4E/yM3vItWR/4=",
       "requires": {
-        "core-js": "^2.4.0",
-        "regenerator-runtime": "^0.11.0"
+        "core-js": "2.6.11",
+        "regenerator-runtime": "0.11.1"
       },
       "dependencies": {
         "regenerator-runtime": {
@@ -470,13 +470,13 @@
       "resolved": "https://registry.npmjs.org/base/-/base-0.11.2.tgz",
       "integrity": "sha512-5T6P4xPgpp0YDFvSWwEZ4NoE3aM4QBQXDzmVbraCkFj8zHM+mba8SyqB5DbZWyR7mYHo6Y7BdQo3MoA4m0TeQg==",
       "requires": {
-        "cache-base": "^1.0.1",
-        "class-utils": "^0.3.5",
-        "component-emitter": "^1.2.1",
-        "define-property": "^1.0.0",
-        "isobject": "^3.0.1",
-        "mixin-deep": "^1.2.0",
-        "pascalcase": "^0.1.1"
+        "cache-base": "1.0.1",
+        "class-utils": "0.3.6",
+        "component-emitter": "1.2.1",
+        "define-property": "1.0.0",
+        "isobject": "3.0.1",
+        "mixin-deep": "1.3.1",
+        "pascalcase": "0.1.1"
       },
       "dependencies": {
         "define-property": {
@@ -484,7 +484,7 @@
           "resolved": "https://registry.npmjs.org/define-property/-/define-property-1.0.0.tgz",
           "integrity": "sha1-dp66rz9KY6rTr56NMEybvnm/sOY=",
           "requires": {
-            "is-descriptor": "^1.0.0"
+            "is-descriptor": "1.0.2"
           }
         },
         "is-accessor-descriptor": {
@@ -492,7 +492,7 @@
           "resolved": "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz",
           "integrity": "sha512-m5hnHTkcVsPfqx3AKlyttIPb7J+XykHvJP2B9bZDjlhLIoEq4XoK64Vg7boZlVWYK6LUY94dYPEE7Lh0ZkZKcQ==",
           "requires": {
-            "kind-of": "^6.0.0"
+            "kind-of": "6.0.2"
           }
         },
         "is-data-descriptor": {
@@ -500,7 +500,7 @@
           "resolved": "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz",
           "integrity": "sha512-jbRXy1FmtAoCjQkVmIVYwuuqDFUbaOeDjmed1tOGPrsMhtJA4rD9tkgA0F1qJ3gRFRXcHYVkdeaP50Q5rE/jLQ==",
           "requires": {
-            "kind-of": "^6.0.0"
+            "kind-of": "6.0.2"
           }
         },
         "is-descriptor": {
@@ -508,9 +508,9 @@
           "resolved": "https://registry.npmjs.org/is-descriptor/-/is-descriptor-1.0.2.tgz",
           "integrity": "sha512-2eis5WqQGV7peooDyLmNEPUrps9+SXX5c9pL3xEB+4e9HnGuDa7mB7kHxHw4CbqS9k1T2hOH3miL8n8WtiYVtg==",
           "requires": {
-            "is-accessor-descriptor": "^1.0.0",
-            "is-data-descriptor": "^1.0.0",
-            "kind-of": "^6.0.2"
+            "is-accessor-descriptor": "1.0.0",
+            "is-data-descriptor": "1.0.0",
+            "kind-of": "6.0.2"
           }
         }
       }
@@ -521,7 +521,7 @@
       "integrity": "sha1-Y7xdy2EzG5K8Bf1SiVPDNGKgb40=",
       "optional": true,
       "requires": {
-        "tweetnacl": "^0.14.3"
+        "tweetnacl": "0.14.5"
       }
     },
     "binary-extensions": {
@@ -535,7 +535,7 @@
       "integrity": "sha1-/FQhoo/UImA2w7OJGmaiW8ZNIm4=",
       "dev": true,
       "requires": {
-        "readable-stream": "~2.0.5"
+        "readable-stream": "2.0.6"
       }
     },
     "boom": {
@@ -544,7 +544,7 @@
       "integrity": "sha1-OciRjO/1eZ+D+UkqhI9iWt0Mdm8=",
       "dev": true,
       "requires": {
-        "hoek": "2.x.x"
+        "hoek": "2.16.3"
       }
     },
     "boxen": {
@@ -553,13 +553,13 @@
       "integrity": "sha512-TNPjfTr432qx7yOjQyaXm3dSR0MH9vXp7eT1BFSl/C51g+EFnOR9hTg1IreahGBmDNCehscshe45f+C1TBZbLw==",
       "dev": true,
       "requires": {
-        "ansi-align": "^2.0.0",
-        "camelcase": "^4.0.0",
-        "chalk": "^2.0.1",
-        "cli-boxes": "^1.0.0",
-        "string-width": "^2.0.0",
-        "term-size": "^1.2.0",
-        "widest-line": "^2.0.0"
+        "ansi-align": "2.0.0",
+        "camelcase": "4.1.0",
+        "chalk": "2.4.2",
+        "cli-boxes": "1.0.0",
+        "string-width": "2.1.1",
+        "term-size": "1.2.0",
+        "widest-line": "2.0.1"
       },
       "dependencies": {
         "ansi-regex": {
@@ -574,7 +574,7 @@
           "integrity": "sha512-VT0ZI6kZRdTh8YyJw3SMbYm/u+NqfsAxEpWO0Pf9sq8/e94WxxOpPKx9FR1FlyCtOVDNOQ+8ntlqFxiRc+r5qA==",
           "dev": true,
           "requires": {
-            "color-convert": "^1.9.0"
+            "color-convert": "1.9.3"
           }
         },
         "camelcase": {
@@ -589,9 +589,9 @@
           "integrity": "sha512-Mti+f9lpJNcwF4tWV8/OrTTtF1gZi+f8FqlyAdouralcFWFQWF2+NgCHShjkCb+IFBLq9buZwE1xckQU4peSuQ==",
           "dev": true,
           "requires": {
-            "ansi-styles": "^3.2.1",
-            "escape-string-regexp": "^1.0.5",
-            "supports-color": "^5.3.0"
+            "ansi-styles": "3.2.1",
+            "escape-string-regexp": "1.0.5",
+            "supports-color": "5.5.0"
           }
         },
         "is-fullwidth-code-point": {
@@ -606,8 +606,8 @@
           "integrity": "sha512-nOqH59deCq9SRHlxq1Aw85Jnt4w6KvLKqWVik6oA9ZklXLNIOlqg4F2yrT1MVaTjAqvVwdfeZ7w7aCvJD7ugkw==",
           "dev": true,
           "requires": {
-            "is-fullwidth-code-point": "^2.0.0",
-            "strip-ansi": "^4.0.0"
+            "is-fullwidth-code-point": "2.0.0",
+            "strip-ansi": "4.0.0"
           }
         },
         "strip-ansi": {
@@ -616,7 +616,7 @@
           "integrity": "sha1-qEeQIusaw2iocTibY1JixQXuNo8=",
           "dev": true,
           "requires": {
-            "ansi-regex": "^3.0.0"
+            "ansi-regex": "3.0.0"
           }
         },
         "supports-color": {
@@ -625,7 +625,7 @@
           "integrity": "sha512-QjVjwdXIt408MIiAqCX4oUKsgU2EqAGzs2Ppkm4aQYbjm+ZEWEcW4SfFNTr4uMNZma0ey4f5lgLrkB0aX0QMow==",
           "dev": true,
           "requires": {
-            "has-flag": "^3.0.0"
+            "has-flag": "3.0.0"
           }
         }
       }
@@ -641,7 +641,7 @@
       "integrity": "sha512-iCuPHDFgrHX7H2vEI/5xpz07zSHB00TpugqhmYtVmMO6518mCuRMoOYFldEBl0g187ufozdaHgWKcYFb61qGiA==",
       "dev": true,
       "requires": {
-        "balanced-match": "^1.0.0",
+        "balanced-match": "1.0.0",
         "concat-map": "0.0.1"
       }
     },
@@ -650,16 +650,16 @@
       "resolved": "https://registry.npmjs.org/braces/-/braces-2.3.2.tgz",
       "integrity": "sha512-aNdbnj9P8PjdXU4ybaWLK2IF3jc/EoDYbC7AazW6to3TRsfXxscC9UXOB5iDiEQrkyIbWp2SLQda4+QAa7nc3w==",
       "requires": {
-        "arr-flatten": "^1.1.0",
-        "array-unique": "^0.3.2",
-        "extend-shallow": "^2.0.1",
-        "fill-range": "^4.0.0",
-        "isobject": "^3.0.1",
-        "repeat-element": "^1.1.2",
-        "snapdragon": "^0.8.1",
-        "snapdragon-node": "^2.0.1",
-        "split-string": "^3.0.2",
-        "to-regex": "^3.0.1"
+        "arr-flatten": "1.1.0",
+        "array-unique": "0.3.2",
+        "extend-shallow": "2.0.1",
+        "fill-range": "4.0.0",
+        "isobject": "3.0.1",
+        "repeat-element": "1.1.3",
+        "snapdragon": "0.8.2",
+        "snapdragon-node": "2.1.1",
+        "split-string": "3.1.0",
+        "to-regex": "3.0.2"
       },
       "dependencies": {
         "extend-shallow": {
@@ -667,7 +667,7 @@
           "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
           "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
           "requires": {
-            "is-extendable": "^0.1.0"
+            "is-extendable": "0.1.1"
           }
         }
       }
@@ -693,15 +693,15 @@
       "resolved": "https://registry.npmjs.org/cache-base/-/cache-base-1.0.1.tgz",
       "integrity": "sha512-AKcdTnFSWATd5/GCPRxr2ChwIJ85CeyrEyjRHlKxQ56d4XJMGym0uAiKn0xbLOGOl3+yRpOTi484dVCEc5AUzQ==",
       "requires": {
-        "collection-visit": "^1.0.0",
-        "component-emitter": "^1.2.1",
-        "get-value": "^2.0.6",
-        "has-value": "^1.0.0",
-        "isobject": "^3.0.1",
-        "set-value": "^2.0.0",
-        "to-object-path": "^0.3.0",
-        "union-value": "^1.0.0",
-        "unset-value": "^1.0.0"
+        "collection-visit": "1.0.0",
+        "component-emitter": "1.2.1",
+        "get-value": "2.0.6",
+        "has-value": "1.0.0",
+        "isobject": "3.0.1",
+        "set-value": "2.0.0",
+        "to-object-path": "0.3.0",
+        "union-value": "1.0.0",
+        "unset-value": "1.0.0"
       }
     },
     "camelcase": {
@@ -733,11 +733,11 @@
       "integrity": "sha1-qBFcVeSnAv5NFQq9OHKCKn4J/Jg=",
       "dev": true,
       "requires": {
-        "ansi-styles": "^2.2.1",
-        "escape-string-regexp": "^1.0.2",
-        "has-ansi": "^2.0.0",
-        "strip-ansi": "^3.0.0",
-        "supports-color": "^2.0.0"
+        "ansi-styles": "2.2.1",
+        "escape-string-regexp": "1.0.5",
+        "has-ansi": "2.0.0",
+        "strip-ansi": "3.0.1",
+        "supports-color": "2.0.0"
       }
     },
     "charenc": {
@@ -751,18 +751,18 @@
       "integrity": "sha512-IwXUx0FXc5ibYmPC2XeEj5mpXoV66sR+t3jqu2NS2GYwCktt3KF1/Qqjws/NkegajBA4RbZ5+DDwlOiJsxDHEg==",
       "dev": true,
       "requires": {
-        "anymatch": "^2.0.0",
-        "async-each": "^1.0.1",
-        "braces": "^2.3.2",
-        "fsevents": "^1.2.7",
-        "glob-parent": "^3.1.0",
-        "inherits": "^2.0.3",
-        "is-binary-path": "^1.0.0",
-        "is-glob": "^4.0.0",
-        "normalize-path": "^3.0.0",
-        "path-is-absolute": "^1.0.0",
-        "readdirp": "^2.2.1",
-        "upath": "^1.1.0"
+        "anymatch": "2.0.0",
+        "async-each": "1.0.1",
+        "braces": "2.3.2",
+        "fsevents": "1.2.7",
+        "glob-parent": "3.1.0",
+        "inherits": "2.0.3",
+        "is-binary-path": "1.0.1",
+        "is-glob": "4.0.0",
+        "normalize-path": "3.0.0",
+        "path-is-absolute": "1.0.1",
+        "readdirp": "2.2.1",
+        "upath": "1.1.1"
       }
     },
     "ci-info": {
@@ -776,10 +776,10 @@
       "resolved": "https://registry.npmjs.org/class-utils/-/class-utils-0.3.6.tgz",
       "integrity": "sha512-qOhPa/Fj7s6TY8H8esGu5QNpMMQxz79h+urzrNYN6mn+9BnxlDGf5QZ+XeCDsxSjPqsSR56XOZOJmpeurnLMeg==",
       "requires": {
-        "arr-union": "^3.1.0",
-        "define-property": "^0.2.5",
-        "isobject": "^3.0.0",
-        "static-extend": "^0.1.1"
+        "arr-union": "3.1.0",
+        "define-property": "0.2.5",
+        "isobject": "3.0.1",
+        "static-extend": "0.1.2"
       },
       "dependencies": {
         "define-property": {
@@ -787,7 +787,7 @@
           "resolved": "https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz",
           "integrity": "sha1-w1se+RjsPJkPmlvFe+BKrOxcgRY=",
           "requires": {
-            "is-descriptor": "^0.1.0"
+            "is-descriptor": "0.1.6"
           }
         }
       }
@@ -809,9 +809,9 @@
       "integrity": "sha1-EgYBU3qRbSmUD5NNo7SNWFo5IT0=",
       "dev": true,
       "requires": {
-        "string-width": "^1.0.1",
-        "strip-ansi": "^3.0.1",
-        "wrap-ansi": "^2.0.0"
+        "string-width": "1.0.2",
+        "strip-ansi": "3.0.1",
+        "wrap-ansi": "2.1.0"
       }
     },
     "code-point-at": {
@@ -825,8 +825,8 @@
       "resolved": "https://registry.npmjs.org/collection-visit/-/collection-visit-1.0.0.tgz",
       "integrity": "sha1-S8A3PBZLwykbTTaMgpzxqApZ3KA=",
       "requires": {
-        "map-visit": "^1.0.0",
-        "object-visit": "^1.0.0"
+        "map-visit": "1.0.0",
+        "object-visit": "1.0.1"
       }
     },
     "color-convert": {
@@ -849,7 +849,7 @@
       "resolved": "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.6.tgz",
       "integrity": "sha1-cj599ugBrFYTETp+RFqbactjKBg=",
       "requires": {
-        "delayed-stream": "~1.0.0"
+        "delayed-stream": "1.0.0"
       }
     },
     "commander": {
@@ -875,9 +875,9 @@
       "integrity": "sha1-U/fUPFHF5D+ByP3QMyHGMb5o1hE=",
       "dev": true,
       "requires": {
-        "inherits": "~2.0.1",
-        "readable-stream": "~2.0.0",
-        "typedarray": "~0.0.5"
+        "inherits": "2.0.3",
+        "readable-stream": "2.0.6",
+        "typedarray": "0.0.6"
       }
     },
     "concurrently": {
@@ -886,15 +886,15 @@
       "integrity": "sha512-D8UI+mlI/bfvrA57SeKOht6sEpb01dKk+8Yee4fbnkk1Ue8r3S+JXoEdFZIpzQlXJGtnxo47Wvvg/kG4ba3U6Q==",
       "dev": true,
       "requires": {
-        "chalk": "^2.4.1",
-        "date-fns": "^1.23.0",
-        "lodash": "^4.17.10",
-        "read-pkg": "^4.0.1",
+        "chalk": "2.4.1",
+        "date-fns": "1.29.0",
+        "lodash": "4.17.10",
+        "read-pkg": "4.0.1",
         "rxjs": "6.2.2",
-        "spawn-command": "^0.0.2-1",
-        "supports-color": "^4.5.0",
-        "tree-kill": "^1.1.0",
-        "yargs": "^12.0.1"
+        "spawn-command": "0.0.2-1",
+        "supports-color": "4.5.0",
+        "tree-kill": "1.2.0",
+        "yargs": "12.0.1"
       },
       "dependencies": {
         "ansi-regex": {
@@ -909,7 +909,7 @@
           "integrity": "sha512-VT0ZI6kZRdTh8YyJw3SMbYm/u+NqfsAxEpWO0Pf9sq8/e94WxxOpPKx9FR1FlyCtOVDNOQ+8ntlqFxiRc+r5qA==",
           "dev": true,
           "requires": {
-            "color-convert": "^1.9.0"
+            "color-convert": "1.9.3"
           }
         },
         "chalk": {
@@ -918,9 +918,9 @@
           "integrity": "sha512-ObN6h1v2fTJSmUXoS3nMQ92LbDK9be4TV+6G+omQlGJFdcUX5heKi1LZ1YnRMIgwTLEj3E24bT6tYni50rlCfQ==",
           "dev": true,
           "requires": {
-            "ansi-styles": "^3.2.1",
-            "escape-string-regexp": "^1.0.5",
-            "supports-color": "^5.3.0"
+            "ansi-styles": "3.2.1",
+            "escape-string-regexp": "1.0.5",
+            "supports-color": "5.5.0"
           },
           "dependencies": {
             "supports-color": {
@@ -929,7 +929,7 @@
               "integrity": "sha512-QjVjwdXIt408MIiAqCX4oUKsgU2EqAGzs2Ppkm4aQYbjm+ZEWEcW4SfFNTr4uMNZma0ey4f5lgLrkB0aX0QMow==",
               "dev": true,
               "requires": {
-                "has-flag": "^3.0.0"
+                "has-flag": "3.0.0"
               }
             }
           }
@@ -940,9 +940,9 @@
           "integrity": "sha512-4FG+RSG9DL7uEwRUZXZn3SS34DiDPfzP0VOiEwtUWlE+AR2EIg+hSyvrIgUUfhdgR/UkAeW2QHgeP+hWrXs7jQ==",
           "dev": true,
           "requires": {
-            "string-width": "^2.1.1",
-            "strip-ansi": "^4.0.0",
-            "wrap-ansi": "^2.0.0"
+            "string-width": "2.1.1",
+            "strip-ansi": "4.0.0",
+            "wrap-ansi": "2.1.0"
           }
         },
         "decamelize": {
@@ -966,9 +966,9 @@
           "integrity": "sha512-3sslG3zJbEYcaC4YVAvDorjGxc7tv6KVATnLPZONiljsUncvihe9BQoVCEs0RZ1kmf4Hk9OBqlZfJZWI4GanKA==",
           "dev": true,
           "requires": {
-            "execa": "^0.7.0",
-            "lcid": "^1.0.0",
-            "mem": "^1.1.0"
+            "execa": "0.7.0",
+            "lcid": "1.0.0",
+            "mem": "1.1.0"
           }
         },
         "string-width": {
@@ -977,8 +977,8 @@
           "integrity": "sha512-nOqH59deCq9SRHlxq1Aw85Jnt4w6KvLKqWVik6oA9ZklXLNIOlqg4F2yrT1MVaTjAqvVwdfeZ7w7aCvJD7ugkw==",
           "dev": true,
           "requires": {
-            "is-fullwidth-code-point": "^2.0.0",
-            "strip-ansi": "^4.0.0"
+            "is-fullwidth-code-point": "2.0.0",
+            "strip-ansi": "4.0.0"
           }
         },
         "strip-ansi": {
@@ -987,7 +987,7 @@
           "integrity": "sha1-qEeQIusaw2iocTibY1JixQXuNo8=",
           "dev": true,
           "requires": {
-            "ansi-regex": "^3.0.0"
+            "ansi-regex": "3.0.0"
           }
         },
         "supports-color": {
@@ -996,7 +996,7 @@
           "integrity": "sha1-vnoN5ITexcXN34s9WRJQRJEvY1s=",
           "dev": true,
           "requires": {
-            "has-flag": "^2.0.0"
+            "has-flag": "2.0.0"
           },
           "dependencies": {
             "has-flag": {
@@ -1013,18 +1013,18 @@
           "integrity": "sha512-B0vRAp1hRX4jgIOWFtjfNjd9OA9RWYZ6tqGA9/I/IrTMsxmKvtWy+ersM+jzpQqbC3YfLzeABPdeTgcJ9eu1qQ==",
           "dev": true,
           "requires": {
-            "cliui": "^4.0.0",
-            "decamelize": "^2.0.0",
-            "find-up": "^3.0.0",
-            "get-caller-file": "^1.0.1",
-            "os-locale": "^2.0.0",
-            "require-directory": "^2.1.1",
-            "require-main-filename": "^1.0.1",
-            "set-blocking": "^2.0.0",
-            "string-width": "^2.0.0",
-            "which-module": "^2.0.0",
-            "y18n": "^3.2.1 || ^4.0.0",
-            "yargs-parser": "^10.1.0"
+            "cliui": "4.1.0",
+            "decamelize": "2.0.0",
+            "find-up": "3.0.0",
+            "get-caller-file": "1.0.3",
+            "os-locale": "2.1.0",
+            "require-directory": "2.1.1",
+            "require-main-filename": "1.0.1",
+            "set-blocking": "2.0.0",
+            "string-width": "2.1.1",
+            "which-module": "2.0.0",
+            "y18n": "3.2.1",
+            "yargs-parser": "10.1.0"
           }
         }
       }
@@ -1035,12 +1035,12 @@
       "integrity": "sha512-vtv5HtGjcYUgFrXc6Kx747B83MRRVS5R1VTEQoXvuP+kMI+if6uywV0nDGoiydJRy4yk7h9od5Og0kxx4zUXmw==",
       "dev": true,
       "requires": {
-        "dot-prop": "^4.1.0",
-        "graceful-fs": "^4.1.2",
-        "make-dir": "^1.0.0",
-        "unique-string": "^1.0.0",
-        "write-file-atomic": "^2.0.0",
-        "xdg-basedir": "^3.0.0"
+        "dot-prop": "4.2.0",
+        "graceful-fs": "4.1.11",
+        "make-dir": "1.3.0",
+        "unique-string": "1.0.0",
+        "write-file-atomic": "2.4.2",
+        "xdg-basedir": "3.0.0"
       }
     },
     "copy-descriptor": {
@@ -1063,11 +1063,11 @@
       "resolved": "https://registry.npmjs.org/counterpart/-/counterpart-0.18.6.tgz",
       "integrity": "sha512-cAIDAYbC3x8S2DDbvFEJ4TzPtPYXma25/kfAkfmprNLlkPWeX4SdUp1c2xklfphqCU3HnDaivR4R3BrAYf5OMA==",
       "requires": {
-        "date-names": "^0.1.11",
-        "except": "^0.1.3",
-        "extend": "^3.0.0",
-        "pluralizers": "^0.1.7",
-        "sprintf-js": "^1.0.3"
+        "date-names": "0.1.13",
+        "except": "0.1.3",
+        "extend": "3.0.1",
+        "pluralizers": "0.1.7",
+        "sprintf-js": "1.0.3"
       }
     },
     "create-error-class": {
@@ -1076,7 +1076,7 @@
       "integrity": "sha1-Br56vvlHo/FKMP1hBnHUAbyot7Y=",
       "dev": true,
       "requires": {
-        "capture-stack-trace": "^1.0.0"
+        "capture-stack-trace": "1.0.1"
       }
     },
     "cross-spawn": {
@@ -1085,9 +1085,9 @@
       "integrity": "sha1-6L0O/uWPz/b4+UUQoKVUu/ojVEk=",
       "dev": true,
       "requires": {
-        "lru-cache": "^4.0.1",
-        "shebang-command": "^1.2.0",
-        "which": "^1.2.9"
+        "lru-cache": "4.1.3",
+        "shebang-command": "1.2.0",
+        "which": "1.2.14"
       }
     },
     "crypt": {
@@ -1101,7 +1101,7 @@
       "integrity": "sha1-O9/s3GCBR8HGcgL6KR59ylnqo7g=",
       "dev": true,
       "requires": {
-        "boom": "2.x.x"
+        "boom": "2.10.1"
       }
     },
     "crypto-random-string": {
@@ -1125,7 +1125,7 @@
       "resolved": "https://registry.npmjs.org/cssstyle/-/cssstyle-1.4.0.tgz",
       "integrity": "sha512-GBrLZYZ4X4x6/QEoBnIrqb8B/f5l4+8me2dkom/j1Gtbxy0kBv6OGzKuAsGM75bkGwGAFkt56Iwg28S3XTZgSA==",
       "requires": {
-        "cssom": "0.3.x"
+        "cssom": "0.3.8"
       }
     },
     "dashdash": {
@@ -1133,7 +1133,7 @@
       "resolved": "https://registry.npmjs.org/dashdash/-/dashdash-1.14.1.tgz",
       "integrity": "sha1-hTz6D3y+L+1d4gMmuN1YEDX24vA=",
       "requires": {
-        "assert-plus": "^1.0.0"
+        "assert-plus": "1.0.0"
       },
       "dependencies": {
         "assert-plus": {
@@ -1148,9 +1148,9 @@
       "resolved": "https://registry.npmjs.org/data-urls/-/data-urls-1.1.0.tgz",
       "integrity": "sha512-YTWYI9se1P55u58gL5GkQHW4P6VJBJ5iBT+B5a7i2Tjadhv52paJG0qHX4A0OR6/t52odI64KP2YvFpkDOi3eQ==",
       "requires": {
-        "abab": "^2.0.0",
-        "whatwg-mimetype": "^2.2.0",
-        "whatwg-url": "^7.0.0"
+        "abab": "2.0.5",
+        "whatwg-mimetype": "2.3.0",
+        "whatwg-url": "7.1.0"
       },
       "dependencies": {
         "whatwg-url": {
@@ -1158,9 +1158,9 @@
           "resolved": "https://registry.npmjs.org/whatwg-url/-/whatwg-url-7.1.0.tgz",
           "integrity": "sha512-WUu7Rg1DroM7oQvGWfOiAK21n74Gg+T4elXEQYkOhtyLeWiJFoOGLXPKI/9gzIie9CtwVLm8wtw6YJdKyxSjeg==",
           "requires": {
-            "lodash.sortby": "^4.7.0",
-            "tr46": "^1.0.1",
-            "webidl-conversions": "^4.0.2"
+            "lodash.sortby": "4.7.0",
+            "tr46": "1.0.1",
+            "webidl-conversions": "4.0.2"
           }
         }
       }
@@ -1214,8 +1214,8 @@
       "resolved": "https://registry.npmjs.org/define-property/-/define-property-2.0.2.tgz",
       "integrity": "sha512-jwK2UV4cnPpbcG7+VRARKTZPUWowwXA8bzH5NP6ud0oeAxyYPuGZUAC7hMugpCdz4BeSZl2Dl9k66CHJ/46ZYQ==",
       "requires": {
-        "is-descriptor": "^1.0.2",
-        "isobject": "^3.0.1"
+        "is-descriptor": "1.0.2",
+        "isobject": "3.0.1"
       },
       "dependencies": {
         "is-accessor-descriptor": {
@@ -1223,7 +1223,7 @@
           "resolved": "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz",
           "integrity": "sha512-m5hnHTkcVsPfqx3AKlyttIPb7J+XykHvJP2B9bZDjlhLIoEq4XoK64Vg7boZlVWYK6LUY94dYPEE7Lh0ZkZKcQ==",
           "requires": {
-            "kind-of": "^6.0.0"
+            "kind-of": "6.0.2"
           }
         },
         "is-data-descriptor": {
@@ -1231,7 +1231,7 @@
           "resolved": "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz",
           "integrity": "sha512-jbRXy1FmtAoCjQkVmIVYwuuqDFUbaOeDjmed1tOGPrsMhtJA4rD9tkgA0F1qJ3gRFRXcHYVkdeaP50Q5rE/jLQ==",
           "requires": {
-            "kind-of": "^6.0.0"
+            "kind-of": "6.0.2"
           }
         },
         "is-descriptor": {
@@ -1239,9 +1239,9 @@
           "resolved": "https://registry.npmjs.org/is-descriptor/-/is-descriptor-1.0.2.tgz",
           "integrity": "sha512-2eis5WqQGV7peooDyLmNEPUrps9+SXX5c9pL3xEB+4e9HnGuDa7mB7kHxHw4CbqS9k1T2hOH3miL8n8WtiYVtg==",
           "requires": {
-            "is-accessor-descriptor": "^1.0.0",
-            "is-data-descriptor": "^1.0.0",
-            "kind-of": "^6.0.2"
+            "is-accessor-descriptor": "1.0.0",
+            "is-data-descriptor": "1.0.0",
+            "kind-of": "6.0.2"
           }
         }
       }
@@ -1261,7 +1261,7 @@
       "resolved": "https://registry.npmjs.org/domexception/-/domexception-1.0.1.tgz",
       "integrity": "sha512-raigMkn7CJNNo6Ihro1fzG7wr3fHuYVytzquZKX5n0yizGsTcYgzdIUwj1X9pK0VvjeihV+XiclP+DjwbsSKug==",
       "requires": {
-        "webidl-conversions": "^4.0.2"
+        "webidl-conversions": "4.0.2"
       }
     },
     "dot-prop": {
@@ -1270,7 +1270,7 @@
       "integrity": "sha512-tUMXrxlExSW6U2EXiiKGSBVdYgtV8qlHL+C10TsW4PURY/ic+eaysnSkwB4kA/mBlCyy/IKDJ+Lc3wbWeaXtuQ==",
       "dev": true,
       "requires": {
-        "is-obj": "^1.0.0"
+        "is-obj": "1.0.1"
       }
     },
     "duplexer3": {
@@ -1285,7 +1285,7 @@
       "integrity": "sha1-D8c6ntXw1Tw4GTOYUj735UN3dQU=",
       "optional": true,
       "requires": {
-        "jsbn": "~0.1.0"
+        "jsbn": "0.1.1"
       }
     },
     "encoding": {
@@ -1293,7 +1293,7 @@
       "resolved": "https://registry.npmjs.org/encoding/-/encoding-0.1.13.tgz",
       "integrity": "sha512-ETBauow1T35Y/WZMkio9jiM0Z5xjHHmJ4XmjZOq1l/dXz3lr2sRn87nJy20RupqSh1F2m3HHPSp8ShIPQJrJ3A==",
       "requires": {
-        "iconv-lite": "^0.6.2"
+        "iconv-lite": "0.6.2"
       }
     },
     "enquire.js": {
@@ -1307,7 +1307,7 @@
       "integrity": "sha512-7dFHNmqeFSEt2ZBsCriorKnn3Z2pj+fd9kmI6QoWw4//DL+icEBfc0U7qJCisqrTsKTjw4fNFy2pW9OqStD84g==",
       "dev": true,
       "requires": {
-        "is-arrayish": "^0.2.1"
+        "is-arrayish": "0.2.1"
       }
     },
     "escape-string-regexp": {
@@ -1321,11 +1321,11 @@
       "resolved": "https://registry.npmjs.org/escodegen/-/escodegen-1.14.3.tgz",
       "integrity": "sha512-qFcX0XJkdg+PB3xjZZG/wKSuT1PnQWx57+TVSjIMmILd2yC/6ByYElPwJnslDsuWuSAp4AwJGumarAAmJch5Kw==",
       "requires": {
-        "esprima": "^4.0.1",
-        "estraverse": "^4.2.0",
-        "esutils": "^2.0.2",
-        "optionator": "^0.8.1",
-        "source-map": "~0.6.1"
+        "esprima": "4.0.1",
+        "estraverse": "4.3.0",
+        "esutils": "2.0.3",
+        "optionator": "0.8.3",
+        "source-map": "0.6.1"
       },
       "dependencies": {
         "esprima": {
@@ -1371,13 +1371,13 @@
       "integrity": "sha1-lEvs00zEHuMqY6n68nrVpl/Fl3c=",
       "dev": true,
       "requires": {
-        "cross-spawn": "^5.0.1",
-        "get-stream": "^3.0.0",
-        "is-stream": "^1.1.0",
-        "npm-run-path": "^2.0.0",
-        "p-finally": "^1.0.0",
-        "signal-exit": "^3.0.0",
-        "strip-eof": "^1.0.0"
+        "cross-spawn": "5.1.0",
+        "get-stream": "3.0.0",
+        "is-stream": "1.1.0",
+        "npm-run-path": "2.0.2",
+        "p-finally": "1.0.0",
+        "signal-exit": "3.0.2",
+        "strip-eof": "1.0.0"
       }
     },
     "expand-brackets": {
@@ -1385,13 +1385,13 @@
       "resolved": "https://registry.npmjs.org/expand-brackets/-/expand-brackets-2.1.4.tgz",
       "integrity": "sha1-t3c14xXOMPa27/D4OwQVGiJEliI=",
       "requires": {
-        "debug": "^2.3.3",
-        "define-property": "^0.2.5",
-        "extend-shallow": "^2.0.1",
-        "posix-character-classes": "^0.1.0",
-        "regex-not": "^1.0.0",
-        "snapdragon": "^0.8.1",
-        "to-regex": "^3.0.1"
+        "debug": "2.6.9",
+        "define-property": "0.2.5",
+        "extend-shallow": "2.0.1",
+        "posix-character-classes": "0.1.1",
+        "regex-not": "1.0.2",
+        "snapdragon": "0.8.2",
+        "to-regex": "3.0.2"
       },
       "dependencies": {
         "debug": {
@@ -1407,7 +1407,7 @@
           "resolved": "https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz",
           "integrity": "sha1-w1se+RjsPJkPmlvFe+BKrOxcgRY=",
           "requires": {
-            "is-descriptor": "^0.1.0"
+            "is-descriptor": "0.1.6"
           }
         },
         "extend-shallow": {
@@ -1415,7 +1415,7 @@
           "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
           "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
           "requires": {
-            "is-extendable": "^0.1.0"
+            "is-extendable": "0.1.1"
           }
         }
       }
@@ -1425,7 +1425,7 @@
       "resolved": "https://registry.npmjs.org/expand-range/-/expand-range-1.8.2.tgz",
       "integrity": "sha1-opnv/TNf4nIeuujiV+x5ZE/IUzc=",
       "requires": {
-        "fill-range": "^2.1.0"
+        "fill-range": "2.2.4"
       },
       "dependencies": {
         "fill-range": {
@@ -1433,11 +1433,11 @@
           "resolved": "https://registry.npmjs.org/fill-range/-/fill-range-2.2.4.tgz",
           "integrity": "sha512-cnrcCbj01+j2gTG921VZPnHbjmdAf8oQV/iGeV2kZxGSyfYjjTyY79ErsK1WJWMpw6DaApEX72binqJE+/d+5Q==",
           "requires": {
-            "is-number": "^2.1.0",
-            "isobject": "^2.0.0",
-            "randomatic": "^3.0.0",
-            "repeat-element": "^1.1.2",
-            "repeat-string": "^1.5.2"
+            "is-number": "2.1.0",
+            "isobject": "2.1.0",
+            "randomatic": "3.1.1",
+            "repeat-element": "1.1.3",
+            "repeat-string": "1.6.1"
           }
         },
         "is-number": {
@@ -1445,7 +1445,7 @@
           "resolved": "https://registry.npmjs.org/is-number/-/is-number-2.1.0.tgz",
           "integrity": "sha1-Afy7s5NGOlSPL0ZszhbezknbkI8=",
           "requires": {
-            "kind-of": "^3.0.2"
+            "kind-of": "3.2.2"
           }
         },
         "isobject": {
@@ -1461,7 +1461,7 @@
           "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
           "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
           "requires": {
-            "is-buffer": "^1.1.5"
+            "is-buffer": "1.1.6"
           }
         }
       }
@@ -1471,7 +1471,7 @@
       "resolved": "https://registry.npmjs.org/expand-tilde/-/expand-tilde-2.0.2.tgz",
       "integrity": "sha1-l+gBqgUt8CRU3kawK/YhZCzchQI=",
       "requires": {
-        "homedir-polyfill": "^1.0.1"
+        "homedir-polyfill": "1.0.3"
       }
     },
     "extend": {
@@ -1484,8 +1484,8 @@
       "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-3.0.2.tgz",
       "integrity": "sha1-Jqcarwc7OfshJxcnRhMcJwQCjbg=",
       "requires": {
-        "assign-symbols": "^1.0.0",
-        "is-extendable": "^1.0.1"
+        "assign-symbols": "1.0.0",
+        "is-extendable": "1.0.1"
       },
       "dependencies": {
         "is-extendable": {
@@ -1493,7 +1493,7 @@
           "resolved": "https://registry.npmjs.org/is-extendable/-/is-extendable-1.0.1.tgz",
           "integrity": "sha512-arnXMxT1hhoKo9k1LZdmlNyJdDDfy2v0fXjFlmok4+i8ul/6WlbVge9bhM74OpNPQPMGUToDtz+KXa1PneJxOA==",
           "requires": {
-            "is-plain-object": "^2.0.4"
+            "is-plain-object": "2.0.4"
           }
         }
       }
@@ -1503,14 +1503,14 @@
       "resolved": "https://registry.npmjs.org/extglob/-/extglob-2.0.4.tgz",
       "integrity": "sha512-Nmb6QXkELsuBr24CJSkilo6UHHgbekK5UiZgfE6UHD3Eb27YC6oD+bhcT+tJ6cl8dmsgdQxnWlcry8ksBIBLpw==",
       "requires": {
-        "array-unique": "^0.3.2",
-        "define-property": "^1.0.0",
-        "expand-brackets": "^2.1.4",
-        "extend-shallow": "^2.0.1",
-        "fragment-cache": "^0.2.1",
-        "regex-not": "^1.0.0",
-        "snapdragon": "^0.8.1",
-        "to-regex": "^3.0.1"
+        "array-unique": "0.3.2",
+        "define-property": "1.0.0",
+        "expand-brackets": "2.1.4",
+        "extend-shallow": "2.0.1",
+        "fragment-cache": "0.2.1",
+        "regex-not": "1.0.2",
+        "snapdragon": "0.8.2",
+        "to-regex": "3.0.2"
       },
       "dependencies": {
         "define-property": {
@@ -1518,7 +1518,7 @@
           "resolved": "https://registry.npmjs.org/define-property/-/define-property-1.0.0.tgz",
           "integrity": "sha1-dp66rz9KY6rTr56NMEybvnm/sOY=",
           "requires": {
-            "is-descriptor": "^1.0.0"
+            "is-descriptor": "1.0.2"
           }
         },
         "extend-shallow": {
@@ -1526,7 +1526,7 @@
           "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
           "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
           "requires": {
-            "is-extendable": "^0.1.0"
+            "is-extendable": "0.1.1"
           }
         },
         "is-accessor-descriptor": {
@@ -1534,7 +1534,7 @@
           "resolved": "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz",
           "integrity": "sha512-m5hnHTkcVsPfqx3AKlyttIPb7J+XykHvJP2B9bZDjlhLIoEq4XoK64Vg7boZlVWYK6LUY94dYPEE7Lh0ZkZKcQ==",
           "requires": {
-            "kind-of": "^6.0.0"
+            "kind-of": "6.0.2"
           }
         },
         "is-data-descriptor": {
@@ -1542,7 +1542,7 @@
           "resolved": "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz",
           "integrity": "sha512-jbRXy1FmtAoCjQkVmIVYwuuqDFUbaOeDjmed1tOGPrsMhtJA4rD9tkgA0F1qJ3gRFRXcHYVkdeaP50Q5rE/jLQ==",
           "requires": {
-            "kind-of": "^6.0.0"
+            "kind-of": "6.0.2"
           }
         },
         "is-descriptor": {
@@ -1550,9 +1550,9 @@
           "resolved": "https://registry.npmjs.org/is-descriptor/-/is-descriptor-1.0.2.tgz",
           "integrity": "sha512-2eis5WqQGV7peooDyLmNEPUrps9+SXX5c9pL3xEB+4e9HnGuDa7mB7kHxHw4CbqS9k1T2hOH3miL8n8WtiYVtg==",
           "requires": {
-            "is-accessor-descriptor": "^1.0.0",
-            "is-data-descriptor": "^1.0.0",
-            "kind-of": "^6.0.2"
+            "is-accessor-descriptor": "1.0.0",
+            "is-data-descriptor": "1.0.0",
+            "kind-of": "6.0.2"
           }
         }
       }
@@ -1595,7 +1595,7 @@
       "integrity": "sha1-i1vL2ewyfFBBv5qwI/1nUPEXfmU=",
       "dev": true,
       "requires": {
-        "pend": "~1.2.0"
+        "pend": "1.2.0"
       }
     },
     "filename-regex": {
@@ -1608,10 +1608,10 @@
       "resolved": "https://registry.npmjs.org/fill-range/-/fill-range-4.0.0.tgz",
       "integrity": "sha1-1USBHUKPmOsGpj3EAtJAPDKMOPc=",
       "requires": {
-        "extend-shallow": "^2.0.1",
-        "is-number": "^3.0.0",
-        "repeat-string": "^1.6.1",
-        "to-regex-range": "^2.1.0"
+        "extend-shallow": "2.0.1",
+        "is-number": "3.0.0",
+        "repeat-string": "1.6.1",
+        "to-regex-range": "2.1.1"
       },
       "dependencies": {
         "extend-shallow": {
@@ -1619,7 +1619,7 @@
           "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
           "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
           "requires": {
-            "is-extendable": "^0.1.0"
+            "is-extendable": "0.1.1"
           }
         }
       }
@@ -1630,7 +1630,7 @@
       "integrity": "sha512-1yD6RmLI1XBfxugvORwlck6f75tYL+iR0jqwsOrOxMZyGYqUuDhJ0l4AXdO1iX/FTs9cBAMEk1gWSEx1kSbylg==",
       "dev": true,
       "requires": {
-        "locate-path": "^3.0.0"
+        "locate-path": "3.0.0"
       }
     },
     "findup-sync": {
@@ -1638,10 +1638,10 @@
       "resolved": "https://registry.npmjs.org/findup-sync/-/findup-sync-2.0.0.tgz",
       "integrity": "sha1-kyaxSIwi0aYIhlCoaQGy2akKLLw=",
       "requires": {
-        "detect-file": "^1.0.0",
-        "is-glob": "^3.1.0",
-        "micromatch": "^3.0.4",
-        "resolve-dir": "^1.0.1"
+        "detect-file": "1.0.0",
+        "is-glob": "3.1.0",
+        "micromatch": "3.1.10",
+        "resolve-dir": "1.0.1"
       },
       "dependencies": {
         "is-glob": {
@@ -1649,7 +1649,7 @@
           "resolved": "https://registry.npmjs.org/is-glob/-/is-glob-3.1.0.tgz",
           "integrity": "sha1-e6WuJCF4BKxwcHuWkiVnSGzD6Eo=",
           "requires": {
-            "is-extglob": "^2.1.0"
+            "is-extglob": "2.1.1"
           }
         }
       }
@@ -1664,7 +1664,7 @@
       "resolved": "https://registry.npmjs.org/for-own/-/for-own-0.1.5.tgz",
       "integrity": "sha1-UmXGgaTylNq78XyVCbZ2OqhFEM4=",
       "requires": {
-        "for-in": "^1.0.1"
+        "for-in": "1.0.2"
       }
     },
     "forever-agent": {
@@ -1678,9 +1678,9 @@
       "integrity": "sha1-rjFduaSQf6BlUCMEpm13M0de43w=",
       "dev": true,
       "requires": {
-        "async": "^2.0.1",
-        "combined-stream": "^1.0.5",
-        "mime-types": "^2.1.11"
+        "async": "2.6.1",
+        "combined-stream": "1.0.6",
+        "mime-types": "2.1.18"
       }
     },
     "fragment-cache": {
@@ -1688,7 +1688,7 @@
       "resolved": "https://registry.npmjs.org/fragment-cache/-/fragment-cache-0.2.1.tgz",
       "integrity": "sha1-QpD60n8T6Jvn8zeZxrxaCr//DRk=",
       "requires": {
-        "map-cache": "^0.2.2"
+        "map-cache": "0.2.2"
       }
     },
     "fs-extra": {
@@ -1697,11 +1697,11 @@
       "integrity": "sha1-muH92UiXeY7at20JGM9C0MMYT6k=",
       "dev": true,
       "requires": {
-        "graceful-fs": "^4.1.2",
-        "jsonfile": "^2.1.0",
-        "klaw": "^1.0.0",
-        "path-is-absolute": "^1.0.0",
-        "rimraf": "^2.2.8"
+        "graceful-fs": "4.1.11",
+        "jsonfile": "2.4.0",
+        "klaw": "1.3.1",
+        "path-is-absolute": "1.0.1",
+        "rimraf": "2.6.2"
       }
     },
     "fs.realpath": {
@@ -1716,8 +1716,8 @@
       "integrity": "sha512-Pxm6sI2MeBD7RdD12RYsqaP0nMiwx8eZBXCa6z2L+mRHm2DYrOYwihmhjpkdjUHwQhslWQjRpEgNq4XvBmaAuw==",
       "optional": true,
       "requires": {
-        "nan": "^2.9.2",
-        "node-pre-gyp": "^0.10.0"
+        "nan": "2.12.1",
+        "node-pre-gyp": "0.10.3"
       },
       "dependencies": {
         "abbrev": {
@@ -2269,7 +2269,7 @@
       "integrity": "sha1-nA4cQDCM6AT0eDYYuTf6iPmdUNA=",
       "dev": true,
       "requires": {
-        "is-property": "^1.0.0"
+        "is-property": "1.0.2"
       }
     },
     "get-caller-file": {
@@ -2294,7 +2294,7 @@
       "resolved": "https://registry.npmjs.org/getpass/-/getpass-0.1.7.tgz",
       "integrity": "sha1-Xv+OPmhNVprkyysSgmBOi6YhSfo=",
       "requires": {
-        "assert-plus": "^1.0.0"
+        "assert-plus": "1.0.0"
       },
       "dependencies": {
         "assert-plus": {
@@ -2310,12 +2310,12 @@
       "integrity": "sha512-MJTUg1kjuLeQCJ+ccE4Vpa6kKVXkPYJ2mOCQyUuKLcLQsdrMCpBPUi8qVE6+YuaJkozeA9NusTAw3hLr8Xe5EQ==",
       "dev": true,
       "requires": {
-        "fs.realpath": "^1.0.0",
-        "inflight": "^1.0.4",
-        "inherits": "2",
-        "minimatch": "^3.0.4",
-        "once": "^1.3.0",
-        "path-is-absolute": "^1.0.0"
+        "fs.realpath": "1.0.0",
+        "inflight": "1.0.6",
+        "inherits": "2.0.3",
+        "minimatch": "3.0.4",
+        "once": "1.4.0",
+        "path-is-absolute": "1.0.1"
       }
     },
     "glob-base": {
@@ -2323,8 +2323,8 @@
       "resolved": "https://registry.npmjs.org/glob-base/-/glob-base-0.3.0.tgz",
       "integrity": "sha1-27Fk9iIbHAscz4Kuoyi0l98Oo8Q=",
       "requires": {
-        "glob-parent": "^2.0.0",
-        "is-glob": "^2.0.0"
+        "glob-parent": "2.0.0",
+        "is-glob": "2.0.1"
       },
       "dependencies": {
         "glob-parent": {
@@ -2332,7 +2332,7 @@
           "resolved": "https://registry.npmjs.org/glob-parent/-/glob-parent-2.0.0.tgz",
           "integrity": "sha1-gTg9ctsFT8zPUzbaqQLxgvbtuyg=",
           "requires": {
-            "is-glob": "^2.0.0"
+            "is-glob": "2.0.1"
           }
         },
         "is-extglob": {
@@ -2345,7 +2345,7 @@
           "resolved": "https://registry.npmjs.org/is-glob/-/is-glob-2.0.1.tgz",
           "integrity": "sha1-0Jb5JqPe1WAPP9/ZEZjLCIjC2GM=",
           "requires": {
-            "is-extglob": "^1.0.0"
+            "is-extglob": "1.0.0"
           }
         }
       }
@@ -2356,8 +2356,8 @@
       "integrity": "sha1-nmr2KZ2NO9K9QEMIMr0RPfkGxa4=",
       "dev": true,
       "requires": {
-        "is-glob": "^3.1.0",
-        "path-dirname": "^1.0.0"
+        "is-glob": "3.1.0",
+        "path-dirname": "1.0.2"
       },
       "dependencies": {
         "is-glob": {
@@ -2366,7 +2366,7 @@
           "integrity": "sha1-e6WuJCF4BKxwcHuWkiVnSGzD6Eo=",
           "dev": true,
           "requires": {
-            "is-extglob": "^2.1.0"
+            "is-extglob": "2.1.1"
           }
         }
       }
@@ -2377,7 +2377,7 @@
       "integrity": "sha1-sxnA3UYH81PzvpzKTHL8FIxJ9EU=",
       "dev": true,
       "requires": {
-        "ini": "^1.3.4"
+        "ini": "1.3.5"
       }
     },
     "global-modules": {
@@ -2385,9 +2385,9 @@
       "resolved": "https://registry.npmjs.org/global-modules/-/global-modules-1.0.0.tgz",
       "integrity": "sha512-sKzpEkf11GpOFuw0Zzjzmt4B4UZwjOcG757PPvrfhxcLFbq0wpsgpOqxpxtxFiCG4DtG93M6XRVbF2oGdev7bg==",
       "requires": {
-        "global-prefix": "^1.0.1",
-        "is-windows": "^1.0.1",
-        "resolve-dir": "^1.0.0"
+        "global-prefix": "1.0.2",
+        "is-windows": "1.0.2",
+        "resolve-dir": "1.0.1"
       }
     },
     "global-prefix": {
@@ -2395,11 +2395,11 @@
       "resolved": "https://registry.npmjs.org/global-prefix/-/global-prefix-1.0.2.tgz",
       "integrity": "sha1-2/dDxsFJklk8ZVVoy2btMsASLr4=",
       "requires": {
-        "expand-tilde": "^2.0.2",
-        "homedir-polyfill": "^1.0.1",
-        "ini": "^1.3.4",
-        "is-windows": "^1.0.1",
-        "which": "^1.2.14"
+        "expand-tilde": "2.0.2",
+        "homedir-polyfill": "1.0.3",
+        "ini": "1.3.5",
+        "is-windows": "1.0.2",
+        "which": "1.2.14"
       }
     },
     "got": {
@@ -2408,17 +2408,17 @@
       "integrity": "sha1-JAzQV4WpoY5WHcG0S0HHY+8ejbA=",
       "dev": true,
       "requires": {
-        "create-error-class": "^3.0.0",
-        "duplexer3": "^0.1.4",
-        "get-stream": "^3.0.0",
-        "is-redirect": "^1.0.0",
-        "is-retry-allowed": "^1.0.0",
-        "is-stream": "^1.0.0",
-        "lowercase-keys": "^1.0.0",
-        "safe-buffer": "^5.0.1",
-        "timed-out": "^4.0.0",
-        "unzip-response": "^2.0.1",
-        "url-parse-lax": "^1.0.0"
+        "create-error-class": "3.0.2",
+        "duplexer3": "0.1.4",
+        "get-stream": "3.0.0",
+        "is-redirect": "1.0.0",
+        "is-retry-allowed": "1.1.0",
+        "is-stream": "1.1.0",
+        "lowercase-keys": "1.0.1",
+        "safe-buffer": "5.1.2",
+        "timed-out": "4.0.1",
+        "unzip-response": "2.0.1",
+        "url-parse-lax": "1.0.0"
       }
     },
     "graceful-fs": {
@@ -2437,10 +2437,10 @@
       "integrity": "sha1-zcvAgYgmWtEZtqWnyKtw7s+10n0=",
       "dev": true,
       "requires": {
-        "chalk": "^1.1.1",
-        "commander": "^2.9.0",
-        "is-my-json-valid": "^2.12.4",
-        "pinkie-promise": "^2.0.0"
+        "chalk": "1.1.3",
+        "commander": "2.15.1",
+        "is-my-json-valid": "2.17.2",
+        "pinkie-promise": "2.0.1"
       }
     },
     "harsh": {
@@ -2454,7 +2454,7 @@
       "integrity": "sha1-NPUEnOHs3ysGSa8+8k5F7TVBbZE=",
       "dev": true,
       "requires": {
-        "ansi-regex": "^2.0.0"
+        "ansi-regex": "2.1.1"
       }
     },
     "has-flag": {
@@ -2468,9 +2468,9 @@
       "resolved": "https://registry.npmjs.org/has-value/-/has-value-1.0.0.tgz",
       "integrity": "sha1-GLKB2lhbHFxR3vJMkw7SmgvmsXc=",
       "requires": {
-        "get-value": "^2.0.6",
-        "has-values": "^1.0.0",
-        "isobject": "^3.0.0"
+        "get-value": "2.0.6",
+        "has-values": "1.0.0",
+        "isobject": "3.0.1"
       }
     },
     "has-values": {
@@ -2478,8 +2478,8 @@
       "resolved": "https://registry.npmjs.org/has-values/-/has-values-1.0.0.tgz",
       "integrity": "sha1-lbC2P+whRmGab+V/51Yo1aOe/k8=",
       "requires": {
-        "is-number": "^3.0.0",
-        "kind-of": "^4.0.0"
+        "is-number": "3.0.0",
+        "kind-of": "4.0.0"
       },
       "dependencies": {
         "kind-of": {
@@ -2487,7 +2487,7 @@
           "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-4.0.0.tgz",
           "integrity": "sha1-IIE989cSkosgc3hpGkUGb65y3Vc=",
           "requires": {
-            "is-buffer": "^1.1.5"
+            "is-buffer": "1.1.6"
           }
         }
       }
@@ -2498,8 +2498,8 @@
       "integrity": "sha1-eNfL/B5tZjA/55g3NlmEUXsvbuE=",
       "dev": true,
       "requires": {
-        "is-stream": "^1.0.1",
-        "pinkie-promise": "^2.0.0"
+        "is-stream": "1.1.0",
+        "pinkie-promise": "2.0.1"
       }
     },
     "hawk": {
@@ -2508,10 +2508,10 @@
       "integrity": "sha1-B4REvXwWQLD+VA0sm3PVlnjo4cQ=",
       "dev": true,
       "requires": {
-        "boom": "2.x.x",
-        "cryptiles": "2.x.x",
-        "hoek": "2.x.x",
-        "sntp": "1.x.x"
+        "boom": "2.10.1",
+        "cryptiles": "2.0.5",
+        "hoek": "2.16.3",
+        "sntp": "1.0.9"
       }
     },
     "hoek": {
@@ -2530,7 +2530,7 @@
       "resolved": "https://registry.npmjs.org/homedir-polyfill/-/homedir-polyfill-1.0.3.tgz",
       "integrity": "sha512-eSmmWE5bZTK2Nou4g0AI3zZ9rswp7GRKoKXS1BLUkvPviOqs4YTN1djQIqrXy9k5gEtdLPy86JjRwsNM9tnDcA==",
       "requires": {
-        "parse-passwd": "^1.0.0"
+        "parse-passwd": "1.0.0"
       }
     },
     "hosted-git-info": {
@@ -2544,7 +2544,7 @@
       "resolved": "https://registry.npmjs.org/html-encoding-sniffer/-/html-encoding-sniffer-1.0.2.tgz",
       "integrity": "sha512-71lZziiDnsuabfdYiUeWdCVyKuqwWi23L8YeIgV9jSSZHCtb6wB1BKWooH7L3tn4/FuZJMVWyNaIDr4RGmaSYw==",
       "requires": {
-        "whatwg-encoding": "^1.0.1"
+        "whatwg-encoding": "1.0.5"
       }
     },
     "http-signature": {
@@ -2553,9 +2553,9 @@
       "integrity": "sha1-33LiZwZs0Kxn+3at+OE0qPvPkb8=",
       "dev": true,
       "requires": {
-        "assert-plus": "^0.2.0",
-        "jsprim": "^1.2.2",
-        "sshpk": "^1.7.0"
+        "assert-plus": "0.2.0",
+        "jsprim": "1.4.1",
+        "sshpk": "1.14.1"
       }
     },
     "iconv-lite": {
@@ -2563,7 +2563,7 @@
       "resolved": "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.6.2.tgz",
       "integrity": "sha512-2y91h5OpQlolefMPmUlivelittSWy0rP+oYVpn6A7GwVHNE8AWzoYOBNmlwks3LobaJxgHCYZAnyNo2GgpNRNQ==",
       "requires": {
-        "safer-buffer": ">= 2.1.2 < 3.0.0"
+        "safer-buffer": "2.1.2"
       }
     },
     "ignore-by-default": {
@@ -2595,8 +2595,8 @@
       "integrity": "sha1-Sb1jMdfQLQwJvJEKEHW6gWW1bfk=",
       "dev": true,
       "requires": {
-        "once": "^1.3.0",
-        "wrappy": "1"
+        "once": "1.4.0",
+        "wrappy": "1.0.2"
       }
     },
     "inherits": {
@@ -2614,7 +2614,7 @@
       "resolved": "https://registry.npmjs.org/invariant/-/invariant-2.2.4.tgz",
       "integrity": "sha512-phJfQVBuaJM5raOpJjSfkiD6BpbCE4Ns//LaXl6wGYtUBY83nWS6Rf9tXm2e8VaK60JEjYldbPif/A2B1C2gNA==",
       "requires": {
-        "loose-envify": "^1.0.0"
+        "loose-envify": "1.4.0"
       }
     },
     "invert-kv": {
@@ -2628,7 +2628,7 @@
       "resolved": "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-0.1.6.tgz",
       "integrity": "sha1-qeEss66Nh2cn7u84Q/igiXtcmNY=",
       "requires": {
-        "kind-of": "^3.0.2"
+        "kind-of": "3.2.2"
       },
       "dependencies": {
         "kind-of": {
@@ -2636,7 +2636,7 @@
           "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
           "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
           "requires": {
-            "is-buffer": "^1.1.5"
+            "is-buffer": "1.1.6"
           }
         }
       }
@@ -2652,7 +2652,7 @@
       "resolved": "https://registry.npmjs.org/is-binary-path/-/is-binary-path-1.0.1.tgz",
       "integrity": "sha1-dfFmQrSA8YenEcgUFh/TpKdlWJg=",
       "requires": {
-        "binary-extensions": "^1.0.0"
+        "binary-extensions": "1.13.0"
       }
     },
     "is-buffer": {
@@ -2666,7 +2666,7 @@
       "integrity": "sha1-VAVy0096wxGfj3bDDLwbHgN6/74=",
       "dev": true,
       "requires": {
-        "builtin-modules": "^1.0.0"
+        "builtin-modules": "1.1.1"
       }
     },
     "is-ci": {
@@ -2675,7 +2675,7 @@
       "integrity": "sha512-s6tfsaQaQi3JNciBH6shVqEDvhGut0SUXr31ag8Pd8BBbVVlcGfWhpPmEOoM6RJ5TFhbypvf5yyRw/VXW1IiWg==",
       "dev": true,
       "requires": {
-        "ci-info": "^1.5.0"
+        "ci-info": "1.6.0"
       }
     },
     "is-data-descriptor": {
@@ -2683,7 +2683,7 @@
       "resolved": "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-0.1.4.tgz",
       "integrity": "sha1-C17mSDiOLIYCgueT8YVv7D8wG1Y=",
       "requires": {
-        "kind-of": "^3.0.2"
+        "kind-of": "3.2.2"
       },
       "dependencies": {
         "kind-of": {
@@ -2691,7 +2691,7 @@
           "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
           "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
           "requires": {
-            "is-buffer": "^1.1.5"
+            "is-buffer": "1.1.6"
           }
         }
       }
@@ -2701,9 +2701,9 @@
       "resolved": "https://registry.npmjs.org/is-descriptor/-/is-descriptor-0.1.6.tgz",
       "integrity": "sha512-avDYr0SB3DwO9zsMov0gKCESFYqCnE4hq/4z3TdUlukEy5t9C0YRq7HLrsN52NAcqXKaepeCD0n+B0arnVG3Hg==",
       "requires": {
-        "is-accessor-descriptor": "^0.1.6",
-        "is-data-descriptor": "^0.1.4",
-        "kind-of": "^5.0.0"
+        "is-accessor-descriptor": "0.1.6",
+        "is-data-descriptor": "0.1.4",
+        "kind-of": "5.1.0"
       },
       "dependencies": {
         "kind-of": {
@@ -2723,7 +2723,7 @@
       "resolved": "https://registry.npmjs.org/is-equal-shallow/-/is-equal-shallow-0.1.3.tgz",
       "integrity": "sha1-IjgJj8Ih3gvPpdnqxMRdY4qhxTQ=",
       "requires": {
-        "is-primitive": "^2.0.0"
+        "is-primitive": "2.0.0"
       }
     },
     "is-extendable": {
@@ -2742,7 +2742,7 @@
       "integrity": "sha1-754xOG8DGn8NZDr4L95QxFfvAMs=",
       "dev": true,
       "requires": {
-        "number-is-nan": "^1.0.0"
+        "number-is-nan": "1.0.1"
       }
     },
     "is-glob": {
@@ -2751,7 +2751,7 @@
       "integrity": "sha1-lSHHaEXMJhCoUgPd8ICpWML/q8A=",
       "dev": true,
       "requires": {
-        "is-extglob": "^2.1.1"
+        "is-extglob": "2.1.1"
       }
     },
     "is-installed-globally": {
@@ -2760,8 +2760,8 @@
       "integrity": "sha1-Df2Y9akRFxbdU13aZJL2e/PSWoA=",
       "dev": true,
       "requires": {
-        "global-dirs": "^0.1.0",
-        "is-path-inside": "^1.0.0"
+        "global-dirs": "0.1.1",
+        "is-path-inside": "1.0.1"
       }
     },
     "is-my-ip-valid": {
@@ -2776,11 +2776,11 @@
       "integrity": "sha512-IBhBslgngMQN8DDSppmgDv7RNrlFotuuDsKcrCP3+HbFaVivIBU7u9oiiErw8sH4ynx3+gOGQ3q2otkgiSi6kg==",
       "dev": true,
       "requires": {
-        "generate-function": "^2.0.0",
-        "generate-object-property": "^1.1.0",
-        "is-my-ip-valid": "^1.0.0",
-        "jsonpointer": "^4.0.0",
-        "xtend": "^4.0.0"
+        "generate-function": "2.0.0",
+        "generate-object-property": "1.2.0",
+        "is-my-ip-valid": "1.0.0",
+        "jsonpointer": "4.0.1",
+        "xtend": "4.0.1"
       }
     },
     "is-npm": {
@@ -2794,7 +2794,7 @@
       "resolved": "https://registry.npmjs.org/is-number/-/is-number-3.0.0.tgz",
       "integrity": "sha1-JP1iAaR4LPUFYcgQJ2r8fRLXEZU=",
       "requires": {
-        "kind-of": "^3.0.2"
+        "kind-of": "3.2.2"
       },
       "dependencies": {
         "kind-of": {
@@ -2802,7 +2802,7 @@
           "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
           "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
           "requires": {
-            "is-buffer": "^1.1.5"
+            "is-buffer": "1.1.6"
           }
         }
       }
@@ -2819,7 +2819,7 @@
       "integrity": "sha1-jvW33lBDej/cprToZe96pVy0gDY=",
       "dev": true,
       "requires": {
-        "path-is-inside": "^1.0.1"
+        "path-is-inside": "1.0.2"
       }
     },
     "is-plain-object": {
@@ -2827,7 +2827,7 @@
       "resolved": "https://registry.npmjs.org/is-plain-object/-/is-plain-object-2.0.4.tgz",
       "integrity": "sha512-h5PpgXkWitc38BBMYawTYMWJHFZJVnBquFE57xFpjB8pJFiF6gZ+bU+WyI/yqXiFR5mdLsgYNaPe8uao6Uv9Og==",
       "requires": {
-        "isobject": "^3.0.1"
+        "isobject": "3.0.1"
       }
     },
     "is-posix-bracket": {
@@ -2893,8 +2893,8 @@
       "resolved": "https://registry.npmjs.org/isomorphic-fetch/-/isomorphic-fetch-2.2.1.tgz",
       "integrity": "sha1-YRrhrPFPXoH3KVB0coGf6XM1WKk=",
       "requires": {
-        "node-fetch": "^1.0.1",
-        "whatwg-fetch": ">=0.10.0"
+        "node-fetch": "1.7.3",
+        "whatwg-fetch": "3.4.1"
       }
     },
     "isstream": {
@@ -2913,8 +2913,8 @@
       "integrity": "sha512-PIt2cnwmPfL4hKNwqeiuz4bKfnzHTBv6HyVgjahA6mPLwPDzjDWrplJBMjHUFxku/N3FlmrbyPclad+I+4mJ3A==",
       "dev": true,
       "requires": {
-        "argparse": "^1.0.7",
-        "esprima": "^4.0.0"
+        "argparse": "1.0.10",
+        "esprima": "4.0.0"
       }
     },
     "jsbn": {
@@ -2928,32 +2928,32 @@
       "resolved": "https://registry.npmjs.org/jsdom/-/jsdom-11.12.0.tgz",
       "integrity": "sha512-y8Px43oyiBM13Zc1z780FrfNLJCXTL40EWlty/LXUtcjykRBNgLlCjWXpfSPBl2iv+N7koQN+dvqszHZgT/Fjw==",
       "requires": {
-        "abab": "^2.0.0",
-        "acorn": "^5.5.3",
-        "acorn-globals": "^4.1.0",
-        "array-equal": "^1.0.0",
-        "cssom": ">= 0.3.2 < 0.4.0",
-        "cssstyle": "^1.0.0",
-        "data-urls": "^1.0.0",
-        "domexception": "^1.0.1",
-        "escodegen": "^1.9.1",
-        "html-encoding-sniffer": "^1.0.2",
-        "left-pad": "^1.3.0",
-        "nwsapi": "^2.0.7",
+        "abab": "2.0.5",
+        "acorn": "5.7.4",
+        "acorn-globals": "4.3.4",
+        "array-equal": "1.0.0",
+        "cssom": "0.3.8",
+        "cssstyle": "1.4.0",
+        "data-urls": "1.1.0",
+        "domexception": "1.0.1",
+        "escodegen": "1.14.3",
+        "html-encoding-sniffer": "1.0.2",
+        "left-pad": "1.3.0",
+        "nwsapi": "2.2.0",
         "parse5": "4.0.0",
-        "pn": "^1.1.0",
-        "request": "^2.87.0",
-        "request-promise-native": "^1.0.5",
-        "sax": "^1.2.4",
-        "symbol-tree": "^3.2.2",
-        "tough-cookie": "^2.3.4",
-        "w3c-hr-time": "^1.0.1",
-        "webidl-conversions": "^4.0.2",
-        "whatwg-encoding": "^1.0.3",
-        "whatwg-mimetype": "^2.1.0",
-        "whatwg-url": "^6.4.1",
-        "ws": "^5.2.0",
-        "xml-name-validator": "^3.0.0"
+        "pn": "1.1.0",
+        "request": "2.88.2",
+        "request-promise-native": "1.0.9",
+        "sax": "1.2.4",
+        "symbol-tree": "3.2.4",
+        "tough-cookie": "2.5.0",
+        "w3c-hr-time": "1.0.2",
+        "webidl-conversions": "4.0.2",
+        "whatwg-encoding": "1.0.5",
+        "whatwg-mimetype": "2.3.0",
+        "whatwg-url": "6.5.0",
+        "ws": "5.2.2",
+        "xml-name-validator": "3.0.0"
       },
       "dependencies": {
         "assert-plus": {
@@ -2981,9 +2981,9 @@
           "resolved": "https://registry.npmjs.org/form-data/-/form-data-2.3.3.tgz",
           "integrity": "sha512-1lLKB2Mu3aGP1Q/2eCOx0fNbRMe7XdwktwOruhfqqd0rIJWwN4Dh+E3hrPSlDCXnSR7UtZ1N38rVXm+6+MEhJQ==",
           "requires": {
-            "asynckit": "^0.4.0",
-            "combined-stream": "^1.0.6",
-            "mime-types": "^2.1.12"
+            "asynckit": "0.4.0",
+            "combined-stream": "1.0.6",
+            "mime-types": "2.1.27"
           }
         },
         "har-validator": {
@@ -2991,8 +2991,8 @@
           "resolved": "https://registry.npmjs.org/har-validator/-/har-validator-5.1.5.tgz",
           "integrity": "sha512-nmT2T0lljbxdQZfspsno9hgrG3Uir6Ks5afism62poxqBM6sDnMEuPmzTq8XN0OEwqKLLdh1jQI3qyE66Nzb3w==",
           "requires": {
-            "ajv": "^6.12.3",
-            "har-schema": "^2.0.0"
+            "ajv": "6.12.5",
+            "har-schema": "2.0.0"
           }
         },
         "http-signature": {
@@ -3000,9 +3000,9 @@
           "resolved": "https://registry.npmjs.org/http-signature/-/http-signature-1.2.0.tgz",
           "integrity": "sha1-muzZJRFHcvPZW2WmCruPfBj7rOE=",
           "requires": {
-            "assert-plus": "^1.0.0",
-            "jsprim": "^1.2.2",
-            "sshpk": "^1.7.0"
+            "assert-plus": "1.0.0",
+            "jsprim": "1.4.1",
+            "sshpk": "1.14.1"
           }
         },
         "mime-db": {
@@ -3033,26 +3033,26 @@
           "resolved": "https://registry.npmjs.org/request/-/request-2.88.2.tgz",
           "integrity": "sha512-MsvtOrfG9ZcrOwAW+Qi+F6HbD0CWXEh9ou77uOb7FM2WPhwT7smM833PzanhJLsgXjN89Ir6V2PczXNnMpwKhw==",
           "requires": {
-            "aws-sign2": "~0.7.0",
-            "aws4": "^1.8.0",
-            "caseless": "~0.12.0",
-            "combined-stream": "~1.0.6",
-            "extend": "~3.0.2",
-            "forever-agent": "~0.6.1",
-            "form-data": "~2.3.2",
-            "har-validator": "~5.1.3",
-            "http-signature": "~1.2.0",
-            "is-typedarray": "~1.0.0",
-            "isstream": "~0.1.2",
-            "json-stringify-safe": "~5.0.1",
-            "mime-types": "~2.1.19",
-            "oauth-sign": "~0.9.0",
-            "performance-now": "^2.1.0",
-            "qs": "~6.5.2",
-            "safe-buffer": "^5.1.2",
-            "tough-cookie": "~2.5.0",
-            "tunnel-agent": "^0.6.0",
-            "uuid": "^3.3.2"
+            "aws-sign2": "0.7.0",
+            "aws4": "1.10.1",
+            "caseless": "0.12.0",
+            "combined-stream": "1.0.6",
+            "extend": "3.0.2",
+            "forever-agent": "0.6.1",
+            "form-data": "2.3.3",
+            "har-validator": "5.1.5",
+            "http-signature": "1.2.0",
+            "is-typedarray": "1.0.0",
+            "isstream": "0.1.2",
+            "json-stringify-safe": "5.0.1",
+            "mime-types": "2.1.27",
+            "oauth-sign": "0.9.0",
+            "performance-now": "2.1.0",
+            "qs": "6.5.2",
+            "safe-buffer": "5.1.2",
+            "tough-cookie": "2.5.0",
+            "tunnel-agent": "0.6.0",
+            "uuid": "3.4.0"
           }
         },
         "tough-cookie": {
@@ -3060,8 +3060,8 @@
           "resolved": "https://registry.npmjs.org/tough-cookie/-/tough-cookie-2.5.0.tgz",
           "integrity": "sha512-nlLsUzgm1kfLXSXfRZMc1KLAugd4hqJHDTvc2hDIwS3mZAfMEuMbc03SujMF+GEcpaX/qboeycw6iO8JwVv2+g==",
           "requires": {
-            "psl": "^1.1.28",
-            "punycode": "^2.1.1"
+            "psl": "1.8.0",
+            "punycode": "2.1.1"
           }
         },
         "tunnel-agent": {
@@ -3069,7 +3069,7 @@
           "resolved": "https://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.6.0.tgz",
           "integrity": "sha1-J6XeoGs2sEoKmWZ3SykIaPD8QP0=",
           "requires": {
-            "safe-buffer": "^5.0.1"
+            "safe-buffer": "5.1.2"
           }
         },
         "uuid": {
@@ -3105,7 +3105,7 @@
       "resolved": "https://registry.npmjs.org/json2mq/-/json2mq-0.2.0.tgz",
       "integrity": "sha1-tje9O6nqvhIsg+lyBIOusQ0skEo=",
       "requires": {
-        "string-convert": "^0.2.0"
+        "string-convert": "0.2.1"
       }
     },
     "jsonfile": {
@@ -3114,7 +3114,7 @@
       "integrity": "sha1-NzaitCi4e72gzIO1P6PWM6NcKug=",
       "dev": true,
       "requires": {
-        "graceful-fs": "^4.1.6"
+        "graceful-fs": "4.1.11"
       }
     },
     "jsonpointer": {
@@ -3158,7 +3158,7 @@
       "integrity": "sha1-QIhDO0azsbolnXh4XY6W9zugJDk=",
       "dev": true,
       "requires": {
-        "graceful-fs": "^4.1.9"
+        "graceful-fs": "4.1.11"
       }
     },
     "latest-version": {
@@ -3167,7 +3167,7 @@
       "integrity": "sha1-ogU4P+oyKzO1rjsYq+4NwvNW7hU=",
       "dev": true,
       "requires": {
-        "package-json": "^4.0.0"
+        "package-json": "4.0.1"
       }
     },
     "lcid": {
@@ -3176,7 +3176,7 @@
       "integrity": "sha1-MIrMr6C8SDo4Z7S28rlQYlHRuDU=",
       "dev": true,
       "requires": {
-        "invert-kv": "^1.0.0"
+        "invert-kv": "1.0.0"
       }
     },
     "left-pad": {
@@ -3190,7 +3190,7 @@
       "integrity": "sha1-i5ZRSp5jTFP75ZqAlPM3jI+yCE0=",
       "dev": true,
       "requires": {
-        "log-symbols": "^1.0.2"
+        "log-symbols": "1.0.2"
       }
     },
     "levn": {
@@ -3198,8 +3198,8 @@
       "resolved": "https://registry.npmjs.org/levn/-/levn-0.3.0.tgz",
       "integrity": "sha1-OwmSTt+fCDwEkP3UwLxEIeBHZO4=",
       "requires": {
-        "prelude-ls": "~1.1.2",
-        "type-check": "~0.3.2"
+        "prelude-ls": "1.1.2",
+        "type-check": "0.3.2"
       }
     },
     "locate-path": {
@@ -3208,8 +3208,8 @@
       "integrity": "sha512-7AO748wWnIhNqAuaty2ZWHkQHRSNfPVIsPIfwEOWO22AmaoVrWavlOcMR5nzTLNYvp36X220/maaRsrec1G65A==",
       "dev": true,
       "requires": {
-        "p-locate": "^3.0.0",
-        "path-exists": "^3.0.0"
+        "p-locate": "3.0.0",
+        "path-exists": "3.0.0"
       }
     },
     "lodash": {
@@ -3245,7 +3245,7 @@
       "integrity": "sha1-N2/3tY6jCGoPCfrMdGF+ylAeGhg=",
       "dev": true,
       "requires": {
-        "chalk": "^1.0.0"
+        "chalk": "1.1.3"
       }
     },
     "loose-envify": {
@@ -3253,7 +3253,7 @@
       "resolved": "https://registry.npmjs.org/loose-envify/-/loose-envify-1.4.0.tgz",
       "integrity": "sha512-lyuxPGr/Wfhrlem2CL/UcnUc1zcqKAImBDzukY7Y5F/yQiNdko6+fRLevlw1HgMySw7f611UIY408EtxRSoK3Q==",
       "requires": {
-        "js-tokens": "^3.0.0 || ^4.0.0"
+        "js-tokens": "4.0.0"
       }
     },
     "lowercase-keys": {
@@ -3268,8 +3268,8 @@
       "integrity": "sha512-fFEhvcgzuIoJVUF8fYr5KR0YqxD238zgObTps31YdADwPPAp82a4M8TrckkWyx7ekNlf9aBcVn81cFwwXngrJA==",
       "dev": true,
       "requires": {
-        "pseudomap": "^1.0.2",
-        "yallist": "^2.1.2"
+        "pseudomap": "1.0.2",
+        "yallist": "2.1.2"
       }
     },
     "make-dir": {
@@ -3278,7 +3278,7 @@
       "integrity": "sha512-2w31R7SJtieJJnQtGc7RVL2StM2vGYVfqUOvUDxH6bC6aJTxPxTF0GnIgCyu7tjockiUWAYQRbxa7vKn34s5sQ==",
       "dev": true,
       "requires": {
-        "pify": "^3.0.0"
+        "pify": "3.0.0"
       }
     },
     "map-cache": {
@@ -3291,7 +3291,7 @@
       "resolved": "https://registry.npmjs.org/map-visit/-/map-visit-1.0.0.tgz",
       "integrity": "sha1-7Nyo8TFE5mDxtb1B8S80edmN+48=",
       "requires": {
-        "object-visit": "^1.0.0"
+        "object-visit": "1.0.1"
       }
     },
     "math-random": {
@@ -3306,7 +3306,7 @@
       "requires": {
         "charenc": "0.0.2",
         "crypt": "0.0.2",
-        "is-buffer": "~1.1.6"
+        "is-buffer": "1.1.6"
       }
     },
     "mem": {
@@ -3315,7 +3315,7 @@
       "integrity": "sha1-Xt1StIXKHZAP5kiVUFOZoN+kX3Y=",
       "dev": true,
       "requires": {
-        "mimic-fn": "^1.0.0"
+        "mimic-fn": "1.2.0"
       }
     },
     "micromatch": {
@@ -3323,19 +3323,19 @@
       "resolved": "https://registry.npmjs.org/micromatch/-/micromatch-3.1.10.tgz",
       "integrity": "sha512-MWikgl9n9M3w+bpsY3He8L+w9eF9338xRl8IAO5viDizwSzziFEyUzo2xrrloB64ADbTf8uA8vRqqttDTOmccg==",
       "requires": {
-        "arr-diff": "^4.0.0",
-        "array-unique": "^0.3.2",
-        "braces": "^2.3.1",
-        "define-property": "^2.0.2",
-        "extend-shallow": "^3.0.2",
-        "extglob": "^2.0.4",
-        "fragment-cache": "^0.2.1",
-        "kind-of": "^6.0.2",
-        "nanomatch": "^1.2.9",
-        "object.pick": "^1.3.0",
-        "regex-not": "^1.0.0",
-        "snapdragon": "^0.8.1",
-        "to-regex": "^3.0.2"
+        "arr-diff": "4.0.0",
+        "array-unique": "0.3.2",
+        "braces": "2.3.2",
+        "define-property": "2.0.2",
+        "extend-shallow": "3.0.2",
+        "extglob": "2.0.4",
+        "fragment-cache": "0.2.1",
+        "kind-of": "6.0.2",
+        "nanomatch": "1.2.13",
+        "object.pick": "1.3.0",
+        "regex-not": "1.0.2",
+        "snapdragon": "0.8.2",
+        "to-regex": "3.0.2"
       }
     },
     "mime-db": {
@@ -3350,7 +3350,7 @@
       "integrity": "sha512-lc/aahn+t4/SWV/qcmumYjymLsWfN3ELhpmVuUFjgsORruuZPVSwAQryq+HHGvO/SI2KVX26bx+En+zhM8g8hQ==",
       "dev": true,
       "requires": {
-        "mime-db": "~1.33.0"
+        "mime-db": "1.33.0"
       }
     },
     "mimic-fn": {
@@ -3365,7 +3365,7 @@
       "integrity": "sha512-yJHVQEhyqPLUTgt9B83PXu6W3rx4MvvHvSUvToogpwoGDOUQ+yDrR0HRot+yOCdCO7u4hX3pWft6kWBBcqh0UA==",
       "dev": true,
       "requires": {
-        "brace-expansion": "^1.1.7"
+        "brace-expansion": "1.1.11"
       }
     },
     "minimist": {
@@ -3379,8 +3379,8 @@
       "resolved": "https://registry.npmjs.org/mixin-deep/-/mixin-deep-1.3.1.tgz",
       "integrity": "sha512-8ZItLHeEgaqEvd5lYBXfm4EZSFCX29Jb9K+lAHhDKzReKBQKj3R+7NOF6tjqYi9t4oI8VUfaWITJQm86wnXGNQ==",
       "requires": {
-        "for-in": "^1.0.2",
-        "is-extendable": "^1.0.1"
+        "for-in": "1.0.2",
+        "is-extendable": "1.0.1"
       },
       "dependencies": {
         "is-extendable": {
@@ -3388,7 +3388,7 @@
           "resolved": "https://registry.npmjs.org/is-extendable/-/is-extendable-1.0.1.tgz",
           "integrity": "sha512-arnXMxT1hhoKo9k1LZdmlNyJdDDfy2v0fXjFlmok4+i8ul/6WlbVge9bhM74OpNPQPMGUToDtz+KXa1PneJxOA==",
           "requires": {
-            "is-plain-object": "^2.0.4"
+            "is-plain-object": "2.0.4"
           }
         }
       }
@@ -3412,7 +3412,7 @@
       "resolved": "https://registry.npmjs.org/mobx-react/-/mobx-react-4.4.3.tgz",
       "integrity": "sha1-uqnsQRZe41rnud8ZvKEBkPNvEX4=",
       "requires": {
-        "hoist-non-react-statics": "^2.3.1"
+        "hoist-non-react-statics": "2.5.5"
       }
     },
     "ms": {
@@ -3431,17 +3431,17 @@
       "resolved": "https://registry.npmjs.org/nanomatch/-/nanomatch-1.2.13.tgz",
       "integrity": "sha512-fpoe2T0RbHwBTBUOftAfBPaDEi06ufaUai0mE6Yn1kacc3SnTErfb/h+X94VXzI64rKFHYImXSvdwGGCmwOqCA==",
       "requires": {
-        "arr-diff": "^4.0.0",
-        "array-unique": "^0.3.2",
-        "define-property": "^2.0.2",
-        "extend-shallow": "^3.0.2",
-        "fragment-cache": "^0.2.1",
-        "is-windows": "^1.0.2",
-        "kind-of": "^6.0.2",
-        "object.pick": "^1.3.0",
-        "regex-not": "^1.0.0",
-        "snapdragon": "^0.8.1",
-        "to-regex": "^3.0.1"
+        "arr-diff": "4.0.0",
+        "array-unique": "0.3.2",
+        "define-property": "2.0.2",
+        "extend-shallow": "3.0.2",
+        "fragment-cache": "0.2.1",
+        "is-windows": "1.0.2",
+        "kind-of": "6.0.2",
+        "object.pick": "1.3.0",
+        "regex-not": "1.0.2",
+        "snapdragon": "0.8.2",
+        "to-regex": "3.0.2"
       }
     },
     "nconf": {
@@ -3450,10 +3450,10 @@
       "integrity": "sha512-fKiXMQrpP7CYWJQzKkPPx9hPgmq+YLDyxcG9N8RpiE9FoCkCbzD0NyW0YhE3xn3Aupe7nnDeIx4PFzYehpHT9Q==",
       "dev": true,
       "requires": {
-        "async": "^1.4.0",
-        "ini": "^1.3.0",
-        "secure-keys": "^1.0.0",
-        "yargs": "^3.19.0"
+        "async": "1.5.2",
+        "ini": "1.3.5",
+        "secure-keys": "1.0.0",
+        "yargs": "3.32.0"
       },
       "dependencies": {
         "async": {
@@ -3469,8 +3469,8 @@
       "resolved": "https://registry.npmjs.org/node-fetch/-/node-fetch-1.7.3.tgz",
       "integrity": "sha512-NhZ4CsKx7cYm2vSrBAr2PvFOe6sWDf0UYLRqA6svUYg7+/TSfVAu49jYC4BvQ4Sms9SZgdqGBgroqfDhJdTyKQ==",
       "requires": {
-        "encoding": "^0.1.11",
-        "is-stream": "^1.0.1"
+        "encoding": "0.1.13",
+        "is-stream": "1.1.0"
       }
     },
     "node-uuid": {
@@ -3485,16 +3485,16 @@
       "integrity": "sha512-we51yBb1TfEvZamFchRgcfLbVYgg0xlGbyXmOtbBzDwxwgewYS/YbZ5tnlnsH51+AoSTTsT3A2E/FloUbtH8cQ==",
       "dev": true,
       "requires": {
-        "chokidar": "^2.1.0",
-        "debug": "^3.1.0",
-        "ignore-by-default": "^1.0.1",
-        "minimatch": "^3.0.4",
-        "pstree.remy": "^1.1.6",
-        "semver": "^5.5.0",
-        "supports-color": "^5.2.0",
-        "touch": "^3.1.0",
-        "undefsafe": "^2.0.2",
-        "update-notifier": "^2.5.0"
+        "chokidar": "2.1.2",
+        "debug": "3.2.6",
+        "ignore-by-default": "1.0.1",
+        "minimatch": "3.0.4",
+        "pstree.remy": "1.1.6",
+        "semver": "5.5.1",
+        "supports-color": "5.5.0",
+        "touch": "3.1.0",
+        "undefsafe": "2.0.2",
+        "update-notifier": "2.5.0"
       },
       "dependencies": {
         "debug": {
@@ -3503,7 +3503,7 @@
           "integrity": "sha512-mel+jf7nrtEl5Pn1Qx46zARXKDpBbvzezse7p7LqINmdoIk8PYP5SySaxEmYv6TZ0JyEKA1hsCId6DIhgITtWQ==",
           "dev": true,
           "requires": {
-            "ms": "^2.1.1"
+            "ms": "2.1.1"
           }
         },
         "ms": {
@@ -3518,7 +3518,7 @@
           "integrity": "sha512-QjVjwdXIt408MIiAqCX4oUKsgU2EqAGzs2Ppkm4aQYbjm+ZEWEcW4SfFNTr4uMNZma0ey4f5lgLrkB0aX0QMow==",
           "dev": true,
           "requires": {
-            "has-flag": "^3.0.0"
+            "has-flag": "3.0.0"
           }
         }
       }
@@ -3529,7 +3529,7 @@
       "integrity": "sha1-bd0hvSoxQXuScn3Vhfim83YI6+4=",
       "dev": true,
       "requires": {
-        "abbrev": "1"
+        "abbrev": "1.1.1"
       }
     },
     "normalize-package-data": {
@@ -3538,10 +3538,10 @@
       "integrity": "sha512-9jjUFbTPfEy3R/ad/2oNbKtW9Hgovl5O1FvFWKkKblNXoN/Oou6+9+KKohPK13Yc3/TyunyWhJp6gvRNR/PPAw==",
       "dev": true,
       "requires": {
-        "hosted-git-info": "^2.1.4",
-        "is-builtin-module": "^1.0.0",
-        "semver": "2 || 3 || 4 || 5",
-        "validate-npm-package-license": "^3.0.1"
+        "hosted-git-info": "2.7.1",
+        "is-builtin-module": "1.0.0",
+        "semver": "5.5.1",
+        "validate-npm-package-license": "3.0.4"
       }
     },
     "normalize-path": {
@@ -3556,7 +3556,7 @@
       "integrity": "sha1-NakjLfo11wZ7TLLd8jV7GHFTbF8=",
       "dev": true,
       "requires": {
-        "path-key": "^2.0.0"
+        "path-key": "2.0.1"
       }
     },
     "npm-watch": {
@@ -3565,8 +3565,8 @@
       "integrity": "sha512-qt3jZd8gKX45m5czKv/CsxzWDMgblu/meL5PefeoViq07e8l7+DBNC8RgHAI0DfA+jJq2n/pJLaNL4yfHR+0qw==",
       "dev": true,
       "requires": {
-        "nodemon": "^1.18.7",
-        "through2": "^2.0.0"
+        "nodemon": "1.18.10",
+        "through2": "2.0.5"
       }
     },
     "number-is-nan": {
@@ -3601,9 +3601,9 @@
       "resolved": "https://registry.npmjs.org/object-copy/-/object-copy-0.1.0.tgz",
       "integrity": "sha1-fn2Fi3gb18mRpBupde04EnVOmYw=",
       "requires": {
-        "copy-descriptor": "^0.1.0",
-        "define-property": "^0.2.5",
-        "kind-of": "^3.0.3"
+        "copy-descriptor": "0.1.1",
+        "define-property": "0.2.5",
+        "kind-of": "3.2.2"
       },
       "dependencies": {
         "define-property": {
@@ -3611,7 +3611,7 @@
           "resolved": "https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz",
           "integrity": "sha1-w1se+RjsPJkPmlvFe+BKrOxcgRY=",
           "requires": {
-            "is-descriptor": "^0.1.0"
+            "is-descriptor": "0.1.6"
           }
         },
         "kind-of": {
@@ -3619,7 +3619,7 @@
           "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
           "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
           "requires": {
-            "is-buffer": "^1.1.5"
+            "is-buffer": "1.1.6"
           }
         }
       }
@@ -3629,7 +3629,7 @@
       "resolved": "https://registry.npmjs.org/object-visit/-/object-visit-1.0.1.tgz",
       "integrity": "sha1-95xEk68MU3e1n+OdOV5BBC3QRbs=",
       "requires": {
-        "isobject": "^3.0.0"
+        "isobject": "3.0.1"
       }
     },
     "object.omit": {
@@ -3637,8 +3637,8 @@
       "resolved": "https://registry.npmjs.org/object.omit/-/object.omit-2.0.1.tgz",
       "integrity": "sha1-Gpx0SCnznbuFjHbKNXmuKlTr0fo=",
       "requires": {
-        "for-own": "^0.1.4",
-        "is-extendable": "^0.1.1"
+        "for-own": "0.1.5",
+        "is-extendable": "0.1.1"
       }
     },
     "object.pick": {
@@ -3646,7 +3646,7 @@
       "resolved": "https://registry.npmjs.org/object.pick/-/object.pick-1.3.0.tgz",
       "integrity": "sha1-h6EKxMFpS9Lhy/U1kaZhQftd10c=",
       "requires": {
-        "isobject": "^3.0.1"
+        "isobject": "3.0.1"
       }
     },
     "once": {
@@ -3655,7 +3655,7 @@
       "integrity": "sha1-WDsap3WWHUsROsF9nFC6753Xa9E=",
       "dev": true,
       "requires": {
-        "wrappy": "1"
+        "wrappy": "1.0.2"
       }
     },
     "optionator": {
@@ -3663,12 +3663,12 @@
       "resolved": "https://registry.npmjs.org/optionator/-/optionator-0.8.3.tgz",
       "integrity": "sha512-+IW9pACdk3XWmmTXG8m3upGUJst5XRGzxMRjXzAuJ1XnIFNvfhjjIuYkDvysnPQ7qzqVzLt78BCruntqRhWQbA==",
       "requires": {
-        "deep-is": "~0.1.3",
-        "fast-levenshtein": "~2.0.6",
-        "levn": "~0.3.0",
-        "prelude-ls": "~1.1.2",
-        "type-check": "~0.3.2",
-        "word-wrap": "~1.2.3"
+        "deep-is": "0.1.3",
+        "fast-levenshtein": "2.0.6",
+        "levn": "0.3.0",
+        "prelude-ls": "1.1.2",
+        "type-check": "0.3.2",
+        "word-wrap": "1.2.3"
       }
     },
     "os-locale": {
@@ -3677,7 +3677,7 @@
       "integrity": "sha1-IPnxeuKe00XoveWDsT0gCYA8FNk=",
       "dev": true,
       "requires": {
-        "lcid": "^1.0.0"
+        "lcid": "1.0.0"
       }
     },
     "p-finally": {
@@ -3692,7 +3692,7 @@
       "integrity": "sha512-fl5s52lI5ahKCernzzIyAP0QAZbGIovtVHGwpcu1Jr/EpzLVDI2myISHwGqK7m8uQFugVWSrbxH7XnhGtvEc+A==",
       "dev": true,
       "requires": {
-        "p-try": "^2.0.0"
+        "p-try": "2.0.0"
       }
     },
     "p-locate": {
@@ -3701,7 +3701,7 @@
       "integrity": "sha512-x+12w/To+4GFfgJhBEpiDcLozRJGegY+Ei7/z0tSLkMmxGZNybVMSfWj9aJn8Z5Fc7dBUNJOOVgPv2H7IwulSQ==",
       "dev": true,
       "requires": {
-        "p-limit": "^2.0.0"
+        "p-limit": "2.0.0"
       }
     },
     "p-try": {
@@ -3716,10 +3716,10 @@
       "integrity": "sha1-iGmgQBJTZhxMTKPabCEh7VVfXu0=",
       "dev": true,
       "requires": {
-        "got": "^6.7.1",
-        "registry-auth-token": "^3.0.1",
-        "registry-url": "^3.0.3",
-        "semver": "^5.1.0"
+        "got": "6.7.1",
+        "registry-auth-token": "3.3.2",
+        "registry-url": "3.1.0",
+        "semver": "5.5.1"
       }
     },
     "parse-glob": {
@@ -3727,10 +3727,10 @@
       "resolved": "https://registry.npmjs.org/parse-glob/-/parse-glob-3.0.4.tgz",
       "integrity": "sha1-ssN2z7EfNVE7rdFz7wu246OIORw=",
       "requires": {
-        "glob-base": "^0.3.0",
-        "is-dotfile": "^1.0.0",
-        "is-extglob": "^1.0.0",
-        "is-glob": "^2.0.0"
+        "glob-base": "0.3.0",
+        "is-dotfile": "1.0.3",
+        "is-extglob": "1.0.0",
+        "is-glob": "2.0.1"
       },
       "dependencies": {
         "is-extglob": {
@@ -3743,7 +3743,7 @@
           "resolved": "https://registry.npmjs.org/is-glob/-/is-glob-2.0.1.tgz",
           "integrity": "sha1-0Jb5JqPe1WAPP9/ZEZjLCIjC2GM=",
           "requires": {
-            "is-extglob": "^1.0.0"
+            "is-extglob": "1.0.0"
           }
         }
       }
@@ -3754,8 +3754,8 @@
       "integrity": "sha1-vjX1Qlvh9/bHRxhPmKeIy5lHfuA=",
       "dev": true,
       "requires": {
-        "error-ex": "^1.3.1",
-        "json-parse-better-errors": "^1.0.1"
+        "error-ex": "1.3.2",
+        "json-parse-better-errors": "1.0.2"
       }
     },
     "parse-passwd": {
@@ -3819,14 +3819,14 @@
       "integrity": "sha1-xpEPZ5NcNyhbYRQyn8LyfV8+MTQ=",
       "dev": true,
       "requires": {
-        "extract-zip": "~1.5.0",
-        "fs-extra": "~0.26.4",
-        "hasha": "^2.2.0",
-        "kew": "~0.7.0",
-        "progress": "~1.1.8",
-        "request": "~2.67.0",
-        "request-progress": "~2.0.1",
-        "which": "~1.2.2"
+        "extract-zip": "1.5.0",
+        "fs-extra": "0.26.7",
+        "hasha": "2.2.0",
+        "kew": "0.7.0",
+        "progress": "1.1.8",
+        "request": "2.67.0",
+        "request-progress": "2.0.1",
+        "which": "1.2.14"
       }
     },
     "pify": {
@@ -3847,7 +3847,7 @@
       "integrity": "sha1-ITXW36ejWMBprJsXh3YogihFD/o=",
       "dev": true,
       "requires": {
-        "pinkie": "^2.0.0"
+        "pinkie": "2.0.4"
       }
     },
     "pluralizers": {
@@ -3897,9 +3897,9 @@
       "resolved": "https://registry.npmjs.org/prop-types/-/prop-types-15.7.2.tgz",
       "integrity": "sha512-8QQikdH7//R2vurIJSutZ1smHYTcLpRWEOlHnzcWHmBYrOGUysKwSsrC89BCiFj3CbrfJ/nXFdJepOVrY1GCHQ==",
       "requires": {
-        "loose-envify": "^1.4.0",
-        "object-assign": "^4.1.1",
-        "react-is": "^16.8.1"
+        "loose-envify": "1.4.0",
+        "object-assign": "4.1.1",
+        "react-is": "16.13.1"
       }
     },
     "pseudomap": {
@@ -3940,7 +3940,7 @@
       "resolved": "https://registry.npmjs.org/raf/-/raf-3.4.1.tgz",
       "integrity": "sha512-Sq4CW4QhwOHE8ucn6J34MqtZCeWFP2aQSmrlroYgqAV1PjStIhJXxYuTgUIfkEk7zTLjmIjLmU5q+fbD1NnOJA==",
       "requires": {
-        "performance-now": "^2.1.0"
+        "performance-now": "2.1.0"
       }
     },
     "randomatic": {
@@ -3948,9 +3948,9 @@
       "resolved": "https://registry.npmjs.org/randomatic/-/randomatic-3.1.1.tgz",
       "integrity": "sha512-TuDE5KxZ0J461RVjrJZCJc+J+zCkTb1MbH9AQUq68sMhOMcy9jLcb3BrZKgp9q9Ncltdg4QVqWrH02W2EFFVYw==",
       "requires": {
-        "is-number": "^4.0.0",
-        "kind-of": "^6.0.0",
-        "math-random": "^1.0.1"
+        "is-number": "4.0.0",
+        "kind-of": "6.0.2",
+        "math-random": "1.0.4"
       },
       "dependencies": {
         "is-number": {
@@ -3966,10 +3966,10 @@
       "integrity": "sha512-y3bGgqKj3QBdxLbLkomlohkvsA8gdAiUQlSBJnBhfn+BPxg4bc62d8TcBW15wavDfgexCgccckhcZvywyQYPOw==",
       "dev": true,
       "requires": {
-        "deep-extend": "^0.6.0",
-        "ini": "~1.3.0",
-        "minimist": "^1.2.0",
-        "strip-json-comments": "~2.0.1"
+        "deep-extend": "0.6.0",
+        "ini": "1.3.5",
+        "minimist": "1.2.0",
+        "strip-json-comments": "2.0.1"
       },
       "dependencies": {
         "minimist": {
@@ -3985,9 +3985,9 @@
       "resolved": "https://registry.npmjs.org/react/-/react-16.13.1.tgz",
       "integrity": "sha512-YMZQQq32xHLX0bz5Mnibv1/LHb3Sqzngu7xstSM+vrkE5Kzr9xE0yMByK5kMoTK30YVJE61WfbxIFFvfeDKT1w==",
       "requires": {
-        "loose-envify": "^1.1.0",
-        "object-assign": "^4.1.1",
-        "prop-types": "^15.6.2"
+        "loose-envify": "1.4.0",
+        "object-assign": "4.1.1",
+        "prop-types": "15.7.2"
       }
     },
     "react-dom": {
@@ -3995,10 +3995,10 @@
       "resolved": "https://registry.npmjs.org/react-dom/-/react-dom-16.13.1.tgz",
       "integrity": "sha512-81PIMmVLnCNLO/fFOQxdQkvEq/+Hfpv24XNJfpyZhTRfO0QcmQIF/PgCa1zCOj2w1hrn12MFLyaJ/G0+Mxtfag==",
       "requires": {
-        "loose-envify": "^1.1.0",
-        "object-assign": "^4.1.1",
-        "prop-types": "^15.6.2",
-        "scheduler": "^0.19.1"
+        "loose-envify": "1.4.0",
+        "object-assign": "4.1.1",
+        "prop-types": "15.7.2",
+        "scheduler": "0.19.1"
       }
     },
     "react-is": {
@@ -4016,13 +4016,13 @@
       "resolved": "https://registry.npmjs.org/react-redux/-/react-redux-5.1.2.tgz",
       "integrity": "sha512-Ns1G0XXc8hDyH/OcBHOxNgQx9ayH3SPxBnFCOidGKSle8pKihysQw2rG/PmciUQRoclhVBO8HMhiRmGXnDja9Q==",
       "requires": {
-        "@babel/runtime": "^7.1.2",
-        "hoist-non-react-statics": "^3.3.0",
-        "invariant": "^2.2.4",
-        "loose-envify": "^1.1.0",
-        "prop-types": "^15.6.1",
-        "react-is": "^16.6.0",
-        "react-lifecycles-compat": "^3.0.0"
+        "@babel/runtime": "7.11.2",
+        "hoist-non-react-statics": "3.3.2",
+        "invariant": "2.2.4",
+        "loose-envify": "1.4.0",
+        "prop-types": "15.7.2",
+        "react-is": "16.13.1",
+        "react-lifecycles-compat": "3.0.4"
       },
       "dependencies": {
         "hoist-non-react-statics": {
@@ -4030,7 +4030,7 @@
           "resolved": "https://registry.npmjs.org/hoist-non-react-statics/-/hoist-non-react-statics-3.3.2.tgz",
           "integrity": "sha512-/gGivxi8JPKWNm/W0jSmzcMPpfpPLc3dY/6GxhX2hQ9iGj3aDfklV4ET7NjKpSinLpJ5vafa9iiGIEZg10SfBw==",
           "requires": {
-            "react-is": "^16.7.0"
+            "react-is": "16.13.1"
           }
         }
       }
@@ -4041,9 +4041,9 @@
       "integrity": "sha1-ljYlN48+HE1IyFhytabsfV0JMjc=",
       "dev": true,
       "requires": {
-        "normalize-package-data": "^2.3.2",
-        "parse-json": "^4.0.0",
-        "pify": "^3.0.0"
+        "normalize-package-data": "2.4.0",
+        "parse-json": "4.0.0",
+        "pify": "3.0.0"
       }
     },
     "readable-stream": {
@@ -4051,12 +4051,12 @@
       "resolved": "https://registry.npmjs.org/readable-stream/-/readable-stream-2.0.6.tgz",
       "integrity": "sha1-j5A0HmilPMySh4jaz80Rs265t44=",
       "requires": {
-        "core-util-is": "~1.0.0",
-        "inherits": "~2.0.1",
-        "isarray": "~1.0.0",
-        "process-nextick-args": "~1.0.6",
-        "string_decoder": "~0.10.x",
-        "util-deprecate": "~1.0.1"
+        "core-util-is": "1.0.2",
+        "inherits": "2.0.3",
+        "isarray": "1.0.0",
+        "process-nextick-args": "1.0.7",
+        "string_decoder": "0.10.31",
+        "util-deprecate": "1.0.2"
       }
     },
     "readdirp": {
@@ -4064,9 +4064,9 @@
       "resolved": "https://registry.npmjs.org/readdirp/-/readdirp-2.2.1.tgz",
       "integrity": "sha512-1JU/8q+VgFZyxwrJ+SVIOsh+KywWGpds3NTqikiKpDMZWScmAYyKIgqkO+ARvNWJfXeXR1zxz7aHF4u4CyH6vQ==",
       "requires": {
-        "graceful-fs": "^4.1.11",
-        "micromatch": "^3.1.10",
-        "readable-stream": "^2.0.2"
+        "graceful-fs": "4.1.11",
+        "micromatch": "3.1.10",
+        "readable-stream": "2.0.6"
       }
     },
     "redux": {
@@ -4074,10 +4074,10 @@
       "resolved": "https://registry.npmjs.org/redux/-/redux-3.7.2.tgz",
       "integrity": "sha512-pNqnf9q1hI5HHZRBkj3bAngGZW/JMCmexDlOxw4XagXY2o1327nHH54LoTjiPJ0gizoqPDRqWyX/00g0hD6w+A==",
       "requires": {
-        "lodash": "^4.2.1",
-        "lodash-es": "^4.2.1",
-        "loose-envify": "^1.1.0",
-        "symbol-observable": "^1.0.3"
+        "lodash": "4.17.10",
+        "lodash-es": "4.17.15",
+        "loose-envify": "1.4.0",
+        "symbol-observable": "1.2.0"
       }
     },
     "redux-logger": {
@@ -4085,7 +4085,7 @@
       "resolved": "https://registry.npmjs.org/redux-logger/-/redux-logger-3.0.6.tgz",
       "integrity": "sha1-91VZZvMJjzyIYExEnPC69XeCdL8=",
       "requires": {
-        "deep-diff": "^0.3.5"
+        "deep-diff": "0.3.8"
       }
     },
     "redux-thunk": {
@@ -4103,7 +4103,7 @@
       "resolved": "https://registry.npmjs.org/regex-cache/-/regex-cache-0.4.4.tgz",
       "integrity": "sha512-nVIZwtCjkC9YgvWkpM55B5rBhBYRZhAaJbgcFYXXsHnbZ9UZI9nnVWYZpBlCqv9ho2eZryPnWrZGsOdPwVWXWQ==",
       "requires": {
-        "is-equal-shallow": "^0.1.3"
+        "is-equal-shallow": "0.1.3"
       }
     },
     "regex-not": {
@@ -4111,8 +4111,8 @@
       "resolved": "https://registry.npmjs.org/regex-not/-/regex-not-1.0.2.tgz",
       "integrity": "sha512-J6SDjUgDxQj5NusnOtdFxDwN/+HWykR8GELwctJ7mdqhcyy1xEc4SRFHUXvxTp661YaVKAjfRLZ9cCqS6tn32A==",
       "requires": {
-        "extend-shallow": "^3.0.2",
-        "safe-regex": "^1.1.0"
+        "extend-shallow": "3.0.2",
+        "safe-regex": "1.1.0"
       }
     },
     "registry-auth-token": {
@@ -4121,8 +4121,8 @@
       "integrity": "sha512-JL39c60XlzCVgNrO+qq68FoNb56w/m7JYvGR2jT5iR1xBrUA3Mfx5Twk5rqTThPmQKMWydGmq8oFtDlxfrmxnQ==",
       "dev": true,
       "requires": {
-        "rc": "^1.1.6",
-        "safe-buffer": "^5.0.1"
+        "rc": "1.2.8",
+        "safe-buffer": "5.1.2"
       }
     },
     "registry-url": {
@@ -4131,7 +4131,7 @@
       "integrity": "sha1-PU74cPc93h138M+aOBQyRE4XSUI=",
       "dev": true,
       "requires": {
-        "rc": "^1.0.1"
+        "rc": "1.2.8"
       }
     },
     "remove-trailing-separator": {
@@ -4155,26 +4155,26 @@
       "integrity": "sha1-ivdHgOK/EeoK6aqWXBHxGv0nJ0I=",
       "dev": true,
       "requires": {
-        "aws-sign2": "~0.6.0",
-        "bl": "~1.0.0",
-        "caseless": "~0.11.0",
-        "combined-stream": "~1.0.5",
-        "extend": "~3.0.0",
-        "forever-agent": "~0.6.1",
-        "form-data": "~1.0.0-rc3",
-        "har-validator": "~2.0.2",
-        "hawk": "~3.1.0",
-        "http-signature": "~1.1.0",
-        "is-typedarray": "~1.0.0",
-        "isstream": "~0.1.2",
-        "json-stringify-safe": "~5.0.1",
-        "mime-types": "~2.1.7",
-        "node-uuid": "~1.4.7",
-        "oauth-sign": "~0.8.0",
-        "qs": "~5.2.0",
-        "stringstream": "~0.0.4",
-        "tough-cookie": "~2.2.0",
-        "tunnel-agent": "~0.4.1"
+        "aws-sign2": "0.6.0",
+        "bl": "1.0.3",
+        "caseless": "0.11.0",
+        "combined-stream": "1.0.6",
+        "extend": "3.0.1",
+        "forever-agent": "0.6.1",
+        "form-data": "1.0.1",
+        "har-validator": "2.0.6",
+        "hawk": "3.1.3",
+        "http-signature": "1.1.1",
+        "is-typedarray": "1.0.0",
+        "isstream": "0.1.2",
+        "json-stringify-safe": "5.0.1",
+        "mime-types": "2.1.18",
+        "node-uuid": "1.4.8",
+        "oauth-sign": "0.8.2",
+        "qs": "5.2.1",
+        "stringstream": "0.0.6",
+        "tough-cookie": "2.2.2",
+        "tunnel-agent": "0.4.3"
       }
     },
     "request-progress": {
@@ -4183,7 +4183,7 @@
       "integrity": "sha1-XTa7V5YcZzqlt4jbyBQf3yO0Tgg=",
       "dev": true,
       "requires": {
-        "throttleit": "^1.0.0"
+        "throttleit": "1.0.0"
       }
     },
     "request-promise-core": {
@@ -4191,7 +4191,7 @@
       "resolved": "https://registry.npmjs.org/request-promise-core/-/request-promise-core-1.1.4.tgz",
       "integrity": "sha512-TTbAfBBRdWD7aNNOoVOBH4pN/KigV6LyapYNNlAPA8JwbovRti1E88m3sYAwsLi5ryhPKsE9APwnjFTgdUjTpw==",
       "requires": {
-        "lodash": "^4.17.19"
+        "lodash": "4.17.20"
       },
       "dependencies": {
         "lodash": {
@@ -4207,8 +4207,8 @@
       "integrity": "sha512-wcW+sIUiWnKgNY0dqCpOZkUbF/I+YPi+f09JZIDa39Ec+q82CpSYniDp+ISgTTbKmnpJWASeJBPZmoxH84wt3g==",
       "requires": {
         "request-promise-core": "1.1.4",
-        "stealthy-require": "^1.1.1",
-        "tough-cookie": "^2.3.3"
+        "stealthy-require": "1.1.1",
+        "tough-cookie": "2.5.0"
       },
       "dependencies": {
         "tough-cookie": {
@@ -4216,8 +4216,8 @@
           "resolved": "https://registry.npmjs.org/tough-cookie/-/tough-cookie-2.5.0.tgz",
           "integrity": "sha512-nlLsUzgm1kfLXSXfRZMc1KLAugd4hqJHDTvc2hDIwS3mZAfMEuMbc03SujMF+GEcpaX/qboeycw6iO8JwVv2+g==",
           "requires": {
-            "psl": "^1.1.28",
-            "punycode": "^2.1.1"
+            "psl": "1.8.0",
+            "punycode": "2.1.1"
           }
         }
       }
@@ -4244,8 +4244,8 @@
       "resolved": "https://registry.npmjs.org/resolve-dir/-/resolve-dir-1.0.1.tgz",
       "integrity": "sha1-eaQGRMNivoLybv/nOcm7U4IEb0M=",
       "requires": {
-        "expand-tilde": "^2.0.0",
-        "global-modules": "^1.0.0"
+        "expand-tilde": "2.0.2",
+        "global-modules": "1.0.0"
       }
     },
     "resolve-url": {
@@ -4264,7 +4264,7 @@
       "integrity": "sha512-lreewLK/BlghmxtfH36YYVg1i8IAce4TI7oao75I1g245+6BctqTVQiBP3YUJ9C6DQOXJmkYR9X9fCLtCOJc5w==",
       "dev": true,
       "requires": {
-        "glob": "^7.0.5"
+        "glob": "7.1.2"
       }
     },
     "rxjs": {
@@ -4273,7 +4273,7 @@
       "integrity": "sha512-0MI8+mkKAXZUF9vMrEoPnaoHkfzBPP4IGwUYRJhIRJF6/w3uByO1e91bEHn8zd43RdkTMKiooYKmwz7RH6zfOQ==",
       "dev": true,
       "requires": {
-        "tslib": "^1.9.0"
+        "tslib": "1.9.3"
       }
     },
     "safe-buffer": {
@@ -4286,7 +4286,7 @@
       "resolved": "https://registry.npmjs.org/safe-regex/-/safe-regex-1.1.0.tgz",
       "integrity": "sha1-QKNmnzsHfR6UPURinhV91IAjvy4=",
       "requires": {
-        "ret": "~0.1.10"
+        "ret": "0.1.15"
       }
     },
     "safer-buffer": {
@@ -4304,8 +4304,8 @@
       "resolved": "https://registry.npmjs.org/scheduler/-/scheduler-0.19.1.tgz",
       "integrity": "sha512-n/zwRWRYSUj0/3g/otKDRPMh6qv2SYMWNq85IEa8iZyAv8od9zDYpGSnpBEjNgcMNq6Scbu5KfIPxNF72R/2EA==",
       "requires": {
-        "loose-envify": "^1.1.0",
-        "object-assign": "^4.1.1"
+        "loose-envify": "1.4.0",
+        "object-assign": "4.1.1"
       }
     },
     "secure-keys": {
@@ -4331,7 +4331,7 @@
       "integrity": "sha1-S7uEN8jTfksM8aaP1ybsbWRdbTY=",
       "dev": true,
       "requires": {
-        "semver": "^5.0.3"
+        "semver": "5.5.1"
       }
     },
     "set-blocking": {
@@ -4345,10 +4345,10 @@
       "resolved": "https://registry.npmjs.org/set-value/-/set-value-2.0.0.tgz",
       "integrity": "sha512-hw0yxk9GT/Hr5yJEYnHNKYXkIA8mVJgd9ditYZCe16ZczcaELYYcfvaXesNACk2O8O0nTiPQcQhGUQj8JLzeeg==",
       "requires": {
-        "extend-shallow": "^2.0.1",
-        "is-extendable": "^0.1.1",
-        "is-plain-object": "^2.0.3",
-        "split-string": "^3.0.1"
+        "extend-shallow": "2.0.1",
+        "is-extendable": "0.1.1",
+        "is-plain-object": "2.0.4",
+        "split-string": "3.1.0"
       },
       "dependencies": {
         "extend-shallow": {
@@ -4356,7 +4356,7 @@
           "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
           "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
           "requires": {
-            "is-extendable": "^0.1.0"
+            "is-extendable": "0.1.1"
           }
         }
       }
@@ -4367,7 +4367,7 @@
       "integrity": "sha1-RKrGW2lbAzmJaMOfNj/uXer98eo=",
       "dev": true,
       "requires": {
-        "shebang-regex": "^1.0.0"
+        "shebang-regex": "1.0.0"
       }
     },
     "shebang-regex": {
@@ -4392,14 +4392,14 @@
       "resolved": "https://registry.npmjs.org/snapdragon/-/snapdragon-0.8.2.tgz",
       "integrity": "sha512-FtyOnWN/wCHTVXOMwvSv26d+ko5vWlIDD6zoUJ7LW8vh+ZBC8QdljveRP+crNrtBwioEUWy/4dMtbBjA4ioNlg==",
       "requires": {
-        "base": "^0.11.1",
-        "debug": "^2.2.0",
-        "define-property": "^0.2.5",
-        "extend-shallow": "^2.0.1",
-        "map-cache": "^0.2.2",
-        "source-map": "^0.5.6",
-        "source-map-resolve": "^0.5.0",
-        "use": "^3.1.0"
+        "base": "0.11.2",
+        "debug": "2.6.9",
+        "define-property": "0.2.5",
+        "extend-shallow": "2.0.1",
+        "map-cache": "0.2.2",
+        "source-map": "0.5.7",
+        "source-map-resolve": "0.5.2",
+        "use": "3.1.1"
       },
       "dependencies": {
         "debug": {
@@ -4415,7 +4415,7 @@
           "resolved": "https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz",
           "integrity": "sha1-w1se+RjsPJkPmlvFe+BKrOxcgRY=",
           "requires": {
-            "is-descriptor": "^0.1.0"
+            "is-descriptor": "0.1.6"
           }
         },
         "extend-shallow": {
@@ -4423,7 +4423,7 @@
           "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
           "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
           "requires": {
-            "is-extendable": "^0.1.0"
+            "is-extendable": "0.1.1"
           }
         }
       }
@@ -4433,9 +4433,9 @@
       "resolved": "https://registry.npmjs.org/snapdragon-node/-/snapdragon-node-2.1.1.tgz",
       "integrity": "sha512-O27l4xaMYt/RSQ5TR3vpWCAB5Kb/czIcqUFOM/C4fYcLnbZUc1PkjTAMjof2pBWaSTwOUd6qUHcFGVGj7aIwnw==",
       "requires": {
-        "define-property": "^1.0.0",
-        "isobject": "^3.0.0",
-        "snapdragon-util": "^3.0.1"
+        "define-property": "1.0.0",
+        "isobject": "3.0.1",
+        "snapdragon-util": "3.0.1"
       },
       "dependencies": {
         "define-property": {
@@ -4443,7 +4443,7 @@
           "resolved": "https://registry.npmjs.org/define-property/-/define-property-1.0.0.tgz",
           "integrity": "sha1-dp66rz9KY6rTr56NMEybvnm/sOY=",
           "requires": {
-            "is-descriptor": "^1.0.0"
+            "is-descriptor": "1.0.2"
           }
         },
         "is-accessor-descriptor": {
@@ -4451,7 +4451,7 @@
           "resolved": "https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz",
           "integrity": "sha512-m5hnHTkcVsPfqx3AKlyttIPb7J+XykHvJP2B9bZDjlhLIoEq4XoK64Vg7boZlVWYK6LUY94dYPEE7Lh0ZkZKcQ==",
           "requires": {
-            "kind-of": "^6.0.0"
+            "kind-of": "6.0.2"
           }
         },
         "is-data-descriptor": {
@@ -4459,7 +4459,7 @@
           "resolved": "https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz",
           "integrity": "sha512-jbRXy1FmtAoCjQkVmIVYwuuqDFUbaOeDjmed1tOGPrsMhtJA4rD9tkgA0F1qJ3gRFRXcHYVkdeaP50Q5rE/jLQ==",
           "requires": {
-            "kind-of": "^6.0.0"
+            "kind-of": "6.0.2"
           }
         },
         "is-descriptor": {
@@ -4467,9 +4467,9 @@
           "resolved": "https://registry.npmjs.org/is-descriptor/-/is-descriptor-1.0.2.tgz",
           "integrity": "sha512-2eis5WqQGV7peooDyLmNEPUrps9+SXX5c9pL3xEB+4e9HnGuDa7mB7kHxHw4CbqS9k1T2hOH3miL8n8WtiYVtg==",
           "requires": {
-            "is-accessor-descriptor": "^1.0.0",
-            "is-data-descriptor": "^1.0.0",
-            "kind-of": "^6.0.2"
+            "is-accessor-descriptor": "1.0.0",
+            "is-data-descriptor": "1.0.0",
+            "kind-of": "6.0.2"
           }
         }
       }
@@ -4479,7 +4479,7 @@
       "resolved": "https://registry.npmjs.org/snapdragon-util/-/snapdragon-util-3.0.1.tgz",
       "integrity": "sha512-mbKkMdQKsjX4BAL4bRYTj21edOf8cN7XHdYUJEe+Zn99hVEYcMvKPct1IqNe7+AZPirn8BCDOQBHQZknqmKlZQ==",
       "requires": {
-        "kind-of": "^3.2.0"
+        "kind-of": "3.2.2"
       },
       "dependencies": {
         "kind-of": {
@@ -4487,7 +4487,7 @@
           "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
           "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
           "requires": {
-            "is-buffer": "^1.1.5"
+            "is-buffer": "1.1.6"
           }
         }
       }
@@ -4498,7 +4498,7 @@
       "integrity": "sha1-ZUEYTMkK7qbG57NeJlkIJEPGYZg=",
       "dev": true,
       "requires": {
-        "hoek": "2.x.x"
+        "hoek": "2.16.3"
       }
     },
     "source-map": {
@@ -4511,11 +4511,11 @@
       "resolved": "https://registry.npmjs.org/source-map-resolve/-/source-map-resolve-0.5.2.tgz",
       "integrity": "sha512-MjqsvNwyz1s0k81Goz/9vRBe9SZdB09Bdw+/zYyO+3CuPk6fouTaxscHkgtE8jKvf01kVfl8riHzERQ/kefaSA==",
       "requires": {
-        "atob": "^2.1.1",
-        "decode-uri-component": "^0.2.0",
-        "resolve-url": "^0.2.1",
-        "source-map-url": "^0.4.0",
-        "urix": "^0.1.0"
+        "atob": "2.1.2",
+        "decode-uri-component": "0.2.0",
+        "resolve-url": "0.2.1",
+        "source-map-url": "0.4.0",
+        "urix": "0.1.0"
       }
     },
     "source-map-support": {
@@ -4523,8 +4523,8 @@
       "resolved": "https://registry.npmjs.org/source-map-support/-/source-map-support-0.5.19.tgz",
       "integrity": "sha512-Wonm7zOCIJzBGQdB+thsPar0kYuCIzYvxZwlBa87yi/Mdjv7Tip2cyVbLj5o0cFPN4EVkuTwb3GDDyUx2DGnGw==",
       "requires": {
-        "buffer-from": "^1.0.0",
-        "source-map": "^0.6.0"
+        "buffer-from": "1.1.1",
+        "source-map": "0.6.1"
       },
       "dependencies": {
         "source-map": {
@@ -4551,8 +4551,8 @@
       "integrity": "sha512-N19o9z5cEyc8yQQPukRCZ9EUmb4HUpnrmaL/fxS2pBo2jbfcFRVuFZ/oFC+vZz0MNNk0h80iMn5/S6qGZOL5+g==",
       "dev": true,
       "requires": {
-        "spdx-expression-parse": "^3.0.0",
-        "spdx-license-ids": "^3.0.0"
+        "spdx-expression-parse": "3.0.0",
+        "spdx-license-ids": "3.0.0"
       }
     },
     "spdx-exceptions": {
@@ -4567,8 +4567,8 @@
       "integrity": "sha512-Yg6D3XpRD4kkOmTpdgbUiEJFKghJH03fiC1OPll5h/0sO6neh2jqRDVHOQ4o/LMea0tgCkbMgea5ip/e+MkWyg==",
       "dev": true,
       "requires": {
-        "spdx-exceptions": "^2.1.0",
-        "spdx-license-ids": "^3.0.0"
+        "spdx-exceptions": "2.1.0",
+        "spdx-license-ids": "3.0.0"
       }
     },
     "spdx-license-ids": {
@@ -4582,7 +4582,7 @@
       "resolved": "https://registry.npmjs.org/split-string/-/split-string-3.1.0.tgz",
       "integrity": "sha512-NzNVhJDYpwceVVii8/Hu6DKfD2G+NrQHlS/V/qgv763EYudVwEcMQNxd2lh+0VrUByXN/oJkl5grOhYWvQUYiw==",
       "requires": {
-        "extend-shallow": "^3.0.0"
+        "extend-shallow": "3.0.2"
       }
     },
     "sprintf-js": {
@@ -4595,14 +4595,14 @@
       "resolved": "https://registry.npmjs.org/sshpk/-/sshpk-1.14.1.tgz",
       "integrity": "sha1-Ew9Zde3a2WPx1W+SuaxsUfqfg+s=",
       "requires": {
-        "asn1": "~0.2.3",
-        "assert-plus": "^1.0.0",
-        "bcrypt-pbkdf": "^1.0.0",
-        "dashdash": "^1.12.0",
-        "ecc-jsbn": "~0.1.1",
-        "getpass": "^0.1.1",
-        "jsbn": "~0.1.0",
-        "tweetnacl": "~0.14.0"
+        "asn1": "0.2.3",
+        "assert-plus": "1.0.0",
+        "bcrypt-pbkdf": "1.0.1",
+        "dashdash": "1.14.1",
+        "ecc-jsbn": "0.1.1",
+        "getpass": "0.1.7",
+        "jsbn": "0.1.1",
+        "tweetnacl": "0.14.5"
       },
       "dependencies": {
         "assert-plus": {
@@ -4617,8 +4617,8 @@
       "resolved": "https://registry.npmjs.org/static-extend/-/static-extend-0.1.2.tgz",
       "integrity": "sha1-YICcOcv/VTNyJv1eC1IPNB8ftcY=",
       "requires": {
-        "define-property": "^0.2.5",
-        "object-copy": "^0.1.0"
+        "define-property": "0.2.5",
+        "object-copy": "0.1.0"
       },
       "dependencies": {
         "define-property": {
@@ -4626,7 +4626,7 @@
           "resolved": "https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz",
           "integrity": "sha1-w1se+RjsPJkPmlvFe+BKrOxcgRY=",
           "requires": {
-            "is-descriptor": "^0.1.0"
+            "is-descriptor": "0.1.6"
           }
         }
       }
@@ -4647,9 +4647,9 @@
       "integrity": "sha1-EYvfW4zcUaKn5w0hHgfisLmxB9M=",
       "dev": true,
       "requires": {
-        "code-point-at": "^1.0.0",
-        "is-fullwidth-code-point": "^1.0.0",
-        "strip-ansi": "^3.0.0"
+        "code-point-at": "1.1.0",
+        "is-fullwidth-code-point": "1.0.0",
+        "strip-ansi": "3.0.1"
       }
     },
     "string_decoder": {
@@ -4669,7 +4669,7 @@
       "integrity": "sha1-ajhfuIU9lS1f8F0Oiq+UJ43GPc8=",
       "dev": true,
       "requires": {
-        "ansi-regex": "^2.0.0"
+        "ansi-regex": "2.1.1"
       }
     },
     "strip-eof": {
@@ -4706,7 +4706,7 @@
       "integrity": "sha1-RYuDiH8oj8Vtb/+/rSYuJmOO+mk=",
       "dev": true,
       "requires": {
-        "execa": "^0.7.0"
+        "execa": "0.7.0"
       }
     },
     "throttleit": {
@@ -4721,8 +4721,8 @@
       "integrity": "sha512-/mrRod8xqpA+IHSLyGCQ2s8SPHiCDEeQJSep1jqLYeEUClOFG2Qsh+4FU6G9VeqpZnGW/Su8LQGc4YKni5rYSQ==",
       "dev": true,
       "requires": {
-        "readable-stream": "~2.3.6",
-        "xtend": "~4.0.1"
+        "readable-stream": "2.3.6",
+        "xtend": "4.0.1"
       },
       "dependencies": {
         "process-nextick-args": {
@@ -4737,13 +4737,13 @@
           "integrity": "sha512-tQtKA9WIAhBF3+VLAseyMqZeBjW0AHJoxOtYqSUZNJxauErmLbVm2FW1y+J/YA9dUrAC39ITejlZWhVIwawkKw==",
           "dev": true,
           "requires": {
-            "core-util-is": "~1.0.0",
-            "inherits": "~2.0.3",
-            "isarray": "~1.0.0",
-            "process-nextick-args": "~2.0.0",
-            "safe-buffer": "~5.1.1",
-            "string_decoder": "~1.1.1",
-            "util-deprecate": "~1.0.1"
+            "core-util-is": "1.0.2",
+            "inherits": "2.0.3",
+            "isarray": "1.0.0",
+            "process-nextick-args": "2.0.0",
+            "safe-buffer": "5.1.2",
+            "string_decoder": "1.1.1",
+            "util-deprecate": "1.0.2"
           }
         },
         "string_decoder": {
@@ -4752,7 +4752,7 @@
           "integrity": "sha512-n/ShnvDi6FHbbVfviro+WojiFzv+s8MPMHBczVePfUpDJLwoLT0ht1l4YwBCbi8pJAveEEdnkHyPyTP/mzRfwg==",
           "dev": true,
           "requires": {
-            "safe-buffer": "~5.1.0"
+            "safe-buffer": "5.1.2"
           }
         }
       }
@@ -4768,7 +4768,7 @@
       "resolved": "https://registry.npmjs.org/to-object-path/-/to-object-path-0.3.0.tgz",
       "integrity": "sha1-KXWIt7Dn4KwI4E5nL4XB9JmeF68=",
       "requires": {
-        "kind-of": "^3.0.2"
+        "kind-of": "3.2.2"
       },
       "dependencies": {
         "kind-of": {
@@ -4776,7 +4776,7 @@
           "resolved": "https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz",
           "integrity": "sha1-MeohpzS6ubuw8yRm2JOupR5KPGQ=",
           "requires": {
-            "is-buffer": "^1.1.5"
+            "is-buffer": "1.1.6"
           }
         }
       }
@@ -4786,10 +4786,10 @@
       "resolved": "https://registry.npmjs.org/to-regex/-/to-regex-3.0.2.tgz",
       "integrity": "sha512-FWtleNAtZ/Ki2qtqej2CXTOayOH9bHDQF+Q48VpWyDXjbYxA4Yz8iDB31zXOBUlOHHKidDbqGVrTUvQMPmBGBw==",
       "requires": {
-        "define-property": "^2.0.2",
-        "extend-shallow": "^3.0.2",
-        "regex-not": "^1.0.2",
-        "safe-regex": "^1.1.0"
+        "define-property": "2.0.2",
+        "extend-shallow": "3.0.2",
+        "regex-not": "1.0.2",
+        "safe-regex": "1.1.0"
       }
     },
     "to-regex-range": {
@@ -4797,8 +4797,8 @@
       "resolved": "https://registry.npmjs.org/to-regex-range/-/to-regex-range-2.1.1.tgz",
       "integrity": "sha1-fIDBe53+vlmeJzZ+DU3VWQFB2zg=",
       "requires": {
-        "is-number": "^3.0.0",
-        "repeat-string": "^1.6.1"
+        "is-number": "3.0.0",
+        "repeat-string": "1.6.1"
       }
     },
     "touch": {
@@ -4807,7 +4807,7 @@
       "integrity": "sha512-WBx8Uy5TLtOSRtIq+M03/sKDrXCLHxwDcquSP2c43Le03/9serjQBIztjRz6FkJez9D/hleyAXTBGLwwZUw9lA==",
       "dev": true,
       "requires": {
-        "nopt": "~1.0.10"
+        "nopt": "1.0.10"
       }
     },
     "tough-cookie": {
@@ -4821,7 +4821,7 @@
       "resolved": "https://registry.npmjs.org/tr46/-/tr46-1.0.1.tgz",
       "integrity": "sha1-qLE/1r/SSJUZZ0zN5VujaTtwbQk=",
       "requires": {
-        "punycode": "^2.1.0"
+        "punycode": "2.1.1"
       }
     },
     "tree-kill": {
@@ -4853,7 +4853,7 @@
       "resolved": "https://registry.npmjs.org/type-check/-/type-check-0.3.2.tgz",
       "integrity": "sha1-WITKtRLPHTVeP7eE8wgEsrUg23I=",
       "requires": {
-        "prelude-ls": "~1.1.2"
+        "prelude-ls": "1.1.2"
       }
     },
     "typedarray": {
@@ -4880,7 +4880,7 @@
       "integrity": "sha1-Il9rngM3Zj4Njnz9aG/Cg2zKznY=",
       "dev": true,
       "requires": {
-        "debug": "^2.2.0"
+        "debug": "2.6.9"
       },
       "dependencies": {
         "debug": {
@@ -4904,10 +4904,10 @@
       "resolved": "https://registry.npmjs.org/union-value/-/union-value-1.0.0.tgz",
       "integrity": "sha1-XHHDTLW61dzr4+oM0IIHulqhrqQ=",
       "requires": {
-        "arr-union": "^3.1.0",
-        "get-value": "^2.0.6",
-        "is-extendable": "^0.1.1",
-        "set-value": "^0.4.3"
+        "arr-union": "3.1.0",
+        "get-value": "2.0.6",
+        "is-extendable": "0.1.1",
+        "set-value": "0.4.3"
       },
       "dependencies": {
         "extend-shallow": {
@@ -4915,7 +4915,7 @@
           "resolved": "https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz",
           "integrity": "sha1-Ua99YUrZqfYQ6huvu5idaxxWiQ8=",
           "requires": {
-            "is-extendable": "^0.1.0"
+            "is-extendable": "0.1.1"
           }
         },
         "set-value": {
@@ -4923,10 +4923,10 @@
           "resolved": "https://registry.npmjs.org/set-value/-/set-value-0.4.3.tgz",
           "integrity": "sha1-fbCPnT0i3H945Trzw79GZuzfzPE=",
           "requires": {
-            "extend-shallow": "^2.0.1",
-            "is-extendable": "^0.1.1",
-            "is-plain-object": "^2.0.1",
-            "to-object-path": "^0.3.0"
+            "extend-shallow": "2.0.1",
+            "is-extendable": "0.1.1",
+            "is-plain-object": "2.0.4",
+            "to-object-path": "0.3.0"
           }
         }
       }
@@ -4937,7 +4937,7 @@
       "integrity": "sha1-nhBXzKhRq7kzmPizOuGHuZyuwRo=",
       "dev": true,
       "requires": {
-        "crypto-random-string": "^1.0.0"
+        "crypto-random-string": "1.0.0"
       }
     },
     "universalify": {
@@ -4950,8 +4950,8 @@
       "resolved": "https://registry.npmjs.org/unset-value/-/unset-value-1.0.0.tgz",
       "integrity": "sha1-g3aHP30jNRef+x5vw6jtDfyKtVk=",
       "requires": {
-        "has-value": "^0.3.1",
-        "isobject": "^3.0.0"
+        "has-value": "0.3.1",
+        "isobject": "3.0.1"
       },
       "dependencies": {
         "has-value": {
@@ -4959,9 +4959,9 @@
           "resolved": "https://registry.npmjs.org/has-value/-/has-value-0.3.1.tgz",
           "integrity": "sha1-ex9YutpiyoJ+wKIHgCVlSEWZXh8=",
           "requires": {
-            "get-value": "^2.0.3",
-            "has-values": "^0.1.4",
-            "isobject": "^2.0.0"
+            "get-value": "2.0.6",
+            "has-values": "0.1.4",
+            "isobject": "2.1.0"
           },
           "dependencies": {
             "isobject": {
@@ -4999,16 +4999,16 @@
       "integrity": "sha512-gwMdhgJHGuj/+wHJJs9e6PcCszpxR1b236igrOkUofGhqJuG+amlIKwApH1IW1WWl7ovZxsX49lMBWLxSdm5Dw==",
       "dev": true,
       "requires": {
-        "boxen": "^1.2.1",
-        "chalk": "^2.0.1",
-        "configstore": "^3.0.0",
-        "import-lazy": "^2.1.0",
-        "is-ci": "^1.0.10",
-        "is-installed-globally": "^0.1.0",
-        "is-npm": "^1.0.0",
-        "latest-version": "^3.0.0",
-        "semver-diff": "^2.0.0",
-        "xdg-basedir": "^3.0.0"
+        "boxen": "1.3.0",
+        "chalk": "2.4.2",
+        "configstore": "3.1.2",
+        "import-lazy": "2.1.0",
+        "is-ci": "1.2.1",
+        "is-installed-globally": "0.1.0",
+        "is-npm": "1.0.0",
+        "latest-version": "3.1.0",
+        "semver-diff": "2.1.0",
+        "xdg-basedir": "3.0.0"
       },
       "dependencies": {
         "ansi-styles": {
@@ -5017,7 +5017,7 @@
           "integrity": "sha512-VT0ZI6kZRdTh8YyJw3SMbYm/u+NqfsAxEpWO0Pf9sq8/e94WxxOpPKx9FR1FlyCtOVDNOQ+8ntlqFxiRc+r5qA==",
           "dev": true,
           "requires": {
-            "color-convert": "^1.9.0"
+            "color-convert": "1.9.3"
           }
         },
         "chalk": {
@@ -5026,9 +5026,9 @@
           "integrity": "sha512-Mti+f9lpJNcwF4tWV8/OrTTtF1gZi+f8FqlyAdouralcFWFQWF2+NgCHShjkCb+IFBLq9buZwE1xckQU4peSuQ==",
           "dev": true,
           "requires": {
-            "ansi-styles": "^3.2.1",
-            "escape-string-regexp": "^1.0.5",
-            "supports-color": "^5.3.0"
+            "ansi-styles": "3.2.1",
+            "escape-string-regexp": "1.0.5",
+            "supports-color": "5.5.0"
           }
         },
         "supports-color": {
@@ -5037,7 +5037,7 @@
           "integrity": "sha512-QjVjwdXIt408MIiAqCX4oUKsgU2EqAGzs2Ppkm4aQYbjm+ZEWEcW4SfFNTr4uMNZma0ey4f5lgLrkB0aX0QMow==",
           "dev": true,
           "requires": {
-            "has-flag": "^3.0.0"
+            "has-flag": "3.0.0"
           }
         }
       }
@@ -5047,7 +5047,7 @@
       "resolved": "https://registry.npmjs.org/uri-js/-/uri-js-4.4.0.tgz",
       "integrity": "sha512-B0yRTzYdUCCn9n+F4+Gh4yIDtMQcaJsmYBDsTSG8g/OejKBodLQ2IHfN3bM7jUsRXndopT7OIXWdYqc1fjmV6g==",
       "requires": {
-        "punycode": "^2.1.0"
+        "punycode": "2.1.1"
       }
     },
     "urix": {
@@ -5060,8 +5060,8 @@
       "resolved": "https://registry.npmjs.org/url-parse/-/url-parse-1.4.7.tgz",
       "integrity": "sha512-d3uaVyzDB9tQoSXFvuSUNFibTd9zxd2bkVrDRvF5TmvWWQwqE4lgYJ5m+x1DbecWkw+LK4RNl2CU1hHuOKPVlg==",
       "requires": {
-        "querystringify": "^2.1.1",
-        "requires-port": "^1.0.0"
+        "querystringify": "2.2.0",
+        "requires-port": "1.0.0"
       }
     },
     "url-parse-lax": {
@@ -5070,7 +5070,7 @@
       "integrity": "sha1-evjzA2Rem9eaJy56FKxovAYJ2nM=",
       "dev": true,
       "requires": {
-        "prepend-http": "^1.0.1"
+        "prepend-http": "1.0.4"
       }
     },
     "use": {
@@ -5089,8 +5089,8 @@
       "integrity": "sha512-DpKm2Ui/xN7/HQKCtpZxoRWBhZ9Z0kqtygG8XCgNQ8ZlDnxuQmWhj566j8fN4Cu3/JmbhsDo7fcAJq4s9h27Ew==",
       "dev": true,
       "requires": {
-        "spdx-correct": "^3.0.0",
-        "spdx-expression-parse": "^3.0.0"
+        "spdx-correct": "3.0.0",
+        "spdx-expression-parse": "3.0.0"
       }
     },
     "verror": {
@@ -5098,9 +5098,9 @@
       "resolved": "https://registry.npmjs.org/verror/-/verror-1.10.0.tgz",
       "integrity": "sha1-OhBcoXBTr1XW4nDB+CiGguGNpAA=",
       "requires": {
-        "assert-plus": "^1.0.0",
+        "assert-plus": "1.0.0",
         "core-util-is": "1.0.2",
-        "extsprintf": "^1.2.0"
+        "extsprintf": "1.3.0"
       },
       "dependencies": {
         "assert-plus": {
@@ -5115,7 +5115,7 @@
       "resolved": "https://registry.npmjs.org/w3c-hr-time/-/w3c-hr-time-1.0.2.tgz",
       "integrity": "sha512-z8P5DvDNjKDoFIHK7q8r8lackT6l+jo/Ye3HOle7l9nICP9lf1Ci25fy9vHd0JOWewkIFzXIEig3TdKT7JQ5fQ==",
       "requires": {
-        "browser-process-hrtime": "^1.0.0"
+        "browser-process-hrtime": "1.0.0"
       }
     },
     "webidl-conversions": {
@@ -5136,7 +5136,7 @@
           "resolved": "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz",
           "integrity": "sha512-v3MXnZAcvnywkTUEZomIActle7RXXeedOR31wwl7VlyoXO4Qi9arvSenNQWne1TcRwhCL1HwLI21bEqdpj8/rA==",
           "requires": {
-            "safer-buffer": ">= 2.1.2 < 3"
+            "safer-buffer": "2.1.2"
           }
         }
       }
@@ -5156,9 +5156,9 @@
       "resolved": "https://registry.npmjs.org/whatwg-url/-/whatwg-url-6.5.0.tgz",
       "integrity": "sha512-rhRZRqx/TLJQWUpQ6bmrt2UV4f0HCQ463yQuONJqC6fO2VoEb1pTYddbe59SkYq87aoM5A3bdhMZiUiVws+fzQ==",
       "requires": {
-        "lodash.sortby": "^4.7.0",
-        "tr46": "^1.0.1",
-        "webidl-conversions": "^4.0.2"
+        "lodash.sortby": "4.7.0",
+        "tr46": "1.0.1",
+        "webidl-conversions": "4.0.2"
       }
     },
     "which": {
@@ -5166,7 +5166,7 @@
       "resolved": "https://registry.npmjs.org/which/-/which-1.2.14.tgz",
       "integrity": "sha1-mofEN48D6CfOyvGs31bHNsAcFOU=",
       "requires": {
-        "isexe": "^2.0.0"
+        "isexe": "2.0.0"
       }
     },
     "which-module": {
@@ -5181,7 +5181,7 @@
       "integrity": "sha512-Ba5m9/Fa4Xt9eb2ELXt77JxVDV8w7qQrH0zS/TWSJdLyAwQjWoOzpzj5lwVftDz6n/EOu3tNACS84v509qwnJA==",
       "dev": true,
       "requires": {
-        "string-width": "^2.1.1"
+        "string-width": "2.1.1"
       },
       "dependencies": {
         "ansi-regex": {
@@ -5202,8 +5202,8 @@
           "integrity": "sha512-nOqH59deCq9SRHlxq1Aw85Jnt4w6KvLKqWVik6oA9ZklXLNIOlqg4F2yrT1MVaTjAqvVwdfeZ7w7aCvJD7ugkw==",
           "dev": true,
           "requires": {
-            "is-fullwidth-code-point": "^2.0.0",
-            "strip-ansi": "^4.0.0"
+            "is-fullwidth-code-point": "2.0.0",
+            "strip-ansi": "4.0.0"
           }
         },
         "strip-ansi": {
@@ -5212,7 +5212,7 @@
           "integrity": "sha1-qEeQIusaw2iocTibY1JixQXuNo8=",
           "dev": true,
           "requires": {
-            "ansi-regex": "^3.0.0"
+            "ansi-regex": "3.0.0"
           }
         }
       }
@@ -5234,8 +5234,8 @@
       "integrity": "sha1-2Pw9KE3QV5T+hJc8rs3Rz4JP3YU=",
       "dev": true,
       "requires": {
-        "string-width": "^1.0.1",
-        "strip-ansi": "^3.0.1"
+        "string-width": "1.0.2",
+        "strip-ansi": "3.0.1"
       }
     },
     "wrappy": {
@@ -5250,9 +5250,9 @@
       "integrity": "sha512-s0b6vB3xIVRLWywa6X9TOMA7k9zio0TMOsl9ZnDkliA/cfJlpHXAscj0gbHVJiTdIuAYpIyqS5GW91fqm6gG5g==",
       "dev": true,
       "requires": {
-        "graceful-fs": "^4.1.11",
-        "imurmurhash": "^0.1.4",
-        "signal-exit": "^3.0.2"
+        "graceful-fs": "4.1.11",
+        "imurmurhash": "0.1.4",
+        "signal-exit": "3.0.2"
       }
     },
     "ws": {
@@ -5260,7 +5260,7 @@
       "resolved": "https://registry.npmjs.org/ws/-/ws-5.2.2.tgz",
       "integrity": "sha512-jaHFD6PFv6UgoIVda6qZllptQsMlDEJkTQcybzzXDYM1XO9Y8em691FGMPmM46WGyLU4z9KMgQN+qrux/nhlHA==",
       "requires": {
-        "async-limiter": "~1.0.0"
+        "async-limiter": "1.0.1"
       }
     },
     "xdg-basedir": {
@@ -5304,12 +5304,12 @@
       "integrity": "sha1-eSIjxroOR62kFAV8trybd2aeHSY=",
       "dev": true,
       "requires": {
-        "glob": "^7.1.2",
-        "js-yaml": "^3.10.0",
+        "glob": "7.1.2",
+        "js-yaml": "3.12.0",
         "leprechaun": "0.0.2",
-        "lodash.merge": "^4.6.1",
-        "lodash.snakecase": "^4.1.1",
-        "nconf": "^0.10.0"
+        "lodash.merge": "4.6.1",
+        "lodash.snakecase": "4.1.1",
+        "nconf": "0.10.0"
       }
     },
     "yargs": {
@@ -5318,13 +5318,13 @@
       "integrity": "sha1-AwiOnr+edWtpdRYR0qXvWRSCyZU=",
       "dev": true,
       "requires": {
-        "camelcase": "^2.0.1",
-        "cliui": "^3.0.3",
-        "decamelize": "^1.1.1",
-        "os-locale": "^1.4.0",
-        "string-width": "^1.0.1",
-        "window-size": "^0.1.4",
-        "y18n": "^3.2.0"
+        "camelcase": "2.1.1",
+        "cliui": "3.2.0",
+        "decamelize": "1.2.0",
+        "os-locale": "1.4.0",
+        "string-width": "1.0.2",
+        "window-size": "0.1.4",
+        "y18n": "3.2.1"
       }
     },
     "yargs-parser": {
@@ -5333,7 +5333,7 @@
       "integrity": "sha512-VCIyR1wJoEBZUqk5PA+oOBF6ypbwh5aNB3I50guxAL/quggdfs4TtNHQrSazFA3fYZ+tEqfs0zIGlv0c/rgjbQ==",
       "dev": true,
       "requires": {
-        "camelcase": "^4.1.0"
+        "camelcase": "4.1.0"
       },
       "dependencies": {
         "camelcase": {
@@ -5350,7 +5350,7 @@
       "integrity": "sha1-lSj0QtqxsihOWLQ3m7GU4i4MQAU=",
       "dev": true,
       "requires": {
-        "fd-slicer": "~1.0.1"
+        "fd-slicer": "1.0.1"
       }
     }
   }
```