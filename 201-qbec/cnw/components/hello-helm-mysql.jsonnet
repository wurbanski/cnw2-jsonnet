local expandHelmTemplate = std.native('expandHelmTemplate');
expandHelmTemplate("../charts/mysql-1.6.6.tgz", 
    { 
        chartProperty: 'chart-value'
    },
    {
        namespace: 'mysql',
        name: 'test', // Uwaga: działa TYLKO w Helmie 2
        thisFile: std.thisFile, // important
    },
)