Uncle Kael's Munin Node Plugins
==================================================================

I like Munin, and I often find myself wanting to build new plugins for it or modify existing ones. This repo gives me a place to do that.

Some of the plugins here will be shamelessly copied from the main [munin/contrib repo](https://github.com/munin/contrib) (though I'll of course leave the copyright information in tact when applicable). Others will be riffs on ideas in those plugins, and still others may be completely new plugins.

The other good thing about doing it this way is that I've bundled the packaging files with the repo, so I can go from PR to updated OS package version very quickly.


## Plugin Directory

### loggrepx_

I found I needed a plugin that would allow me to track values per-logfile in a single graph. The original `loggrep` didn't do that (and I don't know perl), so I built this new version in bash to do just that. Read the header of the script for more information on how it works.

> TODO: Insert sample image here

One of the subtle things about this is that you can actually use it to track _many_ different types of events, not just errors. Basically anything that you log can be turned into a graph. For example, if you want to track the number of logins across various webservices, you can have each service log the login event, then grep for that in all of the pertinent logs.

You could then create another version of the plugin (by symlinking it with a different name) that tracks other logged events.

