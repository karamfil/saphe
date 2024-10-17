module.exports = {
    defaultBrowser: 'Google Chrome',
    // rewrite: [
    //     {
    //         match: ({ url }) => url.protocol === 'http',
    //         url: { protocol: 'https' },
    //     },
    // ],
    handlers: [
        {
            match: [
                ({ opener, url, urlString }) => {
                    finicky.log(JSON.stringify({ opener, keys: finicky.getKeys(), url, urlString }, null, 4));
                },
                '*youtube.com/*',
                '*/sites/PracticeLeadership/*',
            ],
            browser: 'Google Chrome',
        },
        {
            match: [
                () => finicky.getKeys().option,
                '*/subscriptions/b6c2f1bc-c852-4b08-816e-cff3747e3d7e/*',
                '*client_id=04b07795-8ddb-461a-bbee-02f9e1bf7b46*',
                '*client_id=aebc6443-996d-45c2-90f0-388ff96faa56*',
                '*/47995fc2-1f56-47ce-9137-a87caef4be74/*',
                ({ opener }) => ['com.azuredatastudio.oss' /*, 'org.jkiss.dbeaver.core.product'*/].includes(opener.bundleId),
                ({ opener, url }) =>
                    ['com.microsoft.VSCode'].includes(opener.bundleId) &&
                    (url.host == '127.0.0.1' || url.host == 'localhost') &&
                    url.pathname == '/signin' &&
                    url.search.startsWith('nonce='),
            ],
            browser: 'Safari Technology Preview',
        },
        {
            match: ['*chubbglobal.sharepoint.com/*', 'chubbglobal-my.sharepoint.com'],
            browser: 'Firefox',
        },
        {
            match: [
                () => finicky.getKeys().option && finicky.getKeys().command,
                ({ opener }) => ['com.microsoft.teams2', 'com.microsoft.VSCode'].includes(opener.bundleId),
            ],
            browser: 'Browserosaurus',
        },
        // {
        //     match: [() => finicky.getKeys().command],
        //     browser: 'Firefox',
        // },
    ],
};
