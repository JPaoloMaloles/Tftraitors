[frontend repo](https://github.com/JPaoloMaloles/Tftraitors_frontend)

Tftraitors is project to create a Teamfight Tactics (tft) datalytics site that compiles a player's worst comps and performances whether it be for good or evil. 
Tftraitors is made using a React frontend and Ruby on Rails backend.

Use of TFTraitors currently requires a riot api key in your environment files. To do so open your environ variables in a text editor using the following:
<pre><code> code ~/.zshrc
</code></pre>
Then, paste the following anywhere, with your_key being the riot_key you receive from the [Riot Games API](https://developer.riotgames.com/) after logging in:
<pre><code> export RIOT_API_KEY='[your_key]'
</code></pre>
Environment variables are only loaded up when the terminal app is first booted up, thus in order to use the changes made to environment variables you must either quit and reopen terminal or use the following code on your existing terminal windows to refresh them:
<pre><code> source ~/.zshrc
</code></pre>

<h1> Currently Features:</h1>
<ul>
  <li> User authorization and authentication </li>
  <li> Imports of a player's 20 most recent matches from any of Riot's 16 servers using asynchronous web requests </li>
  <li> Routes using react-router-dom </li>
  <li> A beautiful javascript display</li>
</ul>
