// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("channels")

document.addEventListener('turbolinks:load', function() {

  function LikesViewModel() {
    var self = this

    self.likesCount = ko.observable(initialLikeCount)
    self.count = initialLikeCount

    self.likePost = function() {
      self.count += 1
      self.likesCount(self.count)
      return true
    }
  }

  const likes = document.querySelector("#likes")
  if (likes != null) {
    ko.applyBindings(new LikesViewModel(), document.querySelector("#likes"))
  }
})
