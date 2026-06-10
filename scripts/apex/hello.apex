Opportunity opp = new Opportunity(
    Name = 'New Business Opportunity',
    StageName = 'Prospecting',
    Amount=3000,
    CloseDate = Date.today().addDays(30)
);

insert opp;

System.debug('Opportunity created with Id: ' + opp);