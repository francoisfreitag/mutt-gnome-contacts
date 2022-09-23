using Folks;

void main(string[] args) {
    if (args.length < 2) {
        stderr.puts("Usage: %s <search-term>\n".printf(args[0]));
        return;
    }

    // Mutt skips the first line.
    stdout.puts("\n");

    var loop = new MainLoop();
    IndividualAggregator agg = IndividualAggregator.dup();
    Query search = new SimpleQuery(args[1], {"full-name", "email-addresses"});
    SearchView view = new SearchView(agg, search);
    agg.notify["is-quiescent"].connect((obj, pspec) => {
        view.prepare.begin((obj) => {
            foreach (Individual i in view.individuals) {
                foreach (EmailFieldDetails email_field in i.email_addresses) {
                    stdout.puts("%s\t%s\n".printf(email_field.value, i.full_name));
                }
            }
            loop.quit();
        });
    });
    agg.prepare.begin();
    loop.run();
}
