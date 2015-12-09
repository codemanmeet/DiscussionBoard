#[*Discussion Board!*](http://discussionboardvisa.herokuapp.com)#
### A discussion board to enable people to post their thoughts and receive comments from the community. ######


Built using Ruby on Rails. The gems/libraries I used are: 
* Devise (for login purposes)
* Normalize (for CSS compatibilities across browsers)
* simple_form (to make HTML form creation using Ruby objects simpler)

Notes:
* To order the posts on the home page, the following algorithm was used.

  `@post.orderscore = @post.likes - (2*(@post.dislikes)) + (4*(@post.comments.count))`

  The higher the `orderscore` for a post, the higher up it is shown on the home page.
* Users can view posts and comments without login.
* Login is compulsory to submit new posts or add comments. Disliking and liking posts also requires login.
* Editing and deleting posts also require login.


by *Manmeet Singh Saluja*
