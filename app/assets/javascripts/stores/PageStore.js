FF.PageStore = Reflux.createStore({
  listenables: [ FF.PageActions ],
  url: '/facts',

  onFetchNextPage: function(nextPageNo) {
    var self = this;

    $.getJSON(
      this.url,
      { page: nextPageNo },
      function(data) {
        self.trigger(data['facts']);
      }
    );
  }
});
