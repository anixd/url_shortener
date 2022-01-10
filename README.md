### README

App for creating short URLs.

https://docs.google.com/document/d/1xu20Lmr7lh7JKdxNcFhWVYvkhDGIx5o6_HW9Ini1YkA/edit

* Ruby version 2.7.4
 
* Rails version 6.1.4.4

* Configuration:

Set BASE_URL (like https://short.me/) within Url model before run app.
Default BASE_URL is set to 'http://localhost:3000'.

* There's **Url#destroy_old_urls** method for deleting URLs older than 15 days.
But I have not implemented yet automatic deletion :(
I don't so familiar with Sidekiq.

And I didn't have time to implement the styles.


