MassTransit.rb
==============

Ruby port of MassTransit <abbr title="Enterprise Service Bus">ESB</abbr>.

Installation
------------

On Mac OS X
-----------
1. Install [Homebrew](http://wiki.github.com/mxcl/homebrew/installation) 
`ruby -e "$(curl -fsS http://gist.github.com/raw/323731/install_homebrew.rb)"` 
2. Install needed libraries `brew install git rabbitmq`

<h3>RabbitMQ as a Service</h3>

1. Create a launchd plist in /Library/LaunchDaemons/, i.e. `/Library/LaunchDaemons/com.rabbitmq.plist`
2. Load the new configuration `launchctl load /Library/LaunchDaemons/`
3. Start the service `launchctl start com.rabbitmq`

Example com.rabbitmq.plist
<pre><code>&lt;?xml version="1.0" encoding="UTF-8"?>
&lt;!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN"
        "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
&lt;plist version="1.0">
&lt;dict>
        &lt;key>Label&lt;/key>
        &lt;string>com.rabbitmq&lt;/string>
        &lt;key>Program&lt;/key>
        &lt;string>/usr/local/sbin/rabbitmq-server&lt;/string>
        &lt;key>RunAtLoad&lt;/key>
        &lt;true/>
        &lt;key>UserName&lt;/key>
        &lt;string>travis&lt;/string>
        &lt;!-- need erl in the path -->
        &lt;key>EnvironmentVariables&lt;/key>
        &lt;dict>
          &lt;key>PATH&lt;/key>
          &lt;string>/usr/local/sbin:/usr/bin:/bin:/usr/local/bin&lt;/string>
        &lt;/dict>
&lt;/dict>
&lt;/plist></code></pre>

Windows
-------
1. ... [install ruby]
2. Install rabbitmq

Everyone
--------
3. Install bindings `sudo gem sources -a http://gems.github.com && sudo gem install carrot`
