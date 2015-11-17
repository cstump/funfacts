FF.FactsIndex.FactList = React.createClass({
  propTypes: {
    facts: React.PropTypes.arrayOf(React.PropTypes.object).isRequired
  },

  mixins: [
    Reflux.listenTo(FF.PageStore,"onPageFetch")
  ],

  onPageFetch: function(moreFacts) {
    this.setState({
      pageNo: this.state.pageNo + 1,
      facts: this.state.facts.concat(moreFacts),
      isInfiniteLoading: false
    });
  },

  getInitialState: function() {
    return {
      pageNo: 1,
      facts: this.props.facts,
      isInfiniteLoading: false
    };
  },

  renderFacts: function() {
    return this.state.facts.map(function(fact) {
      return (
        <div className="list-group-item" key={fact.id}>
          <FF.FactsIndex.Fact fact={fact}/>
        </div>
      );
    });
  },

  fetchNextPage: function() {
    this.setState({ isInfiniteLoading: true });
    FF.PageActions.fetchNextPage(this.state.pageNo + 1);
  },

  renderSpinner: function() {
    return <div className="infinite-list-item">Loading...</div>;
  },

  render: function() {
    return (
      <Infinite className="list-group"
                elementHeight={149}
                containerHeight={window.innerHeight}
                infiniteLoadBeginEdgeOffset={200}
                onInfiniteLoad={this.fetchNextPage}
                preloadBatchSize={Infinite.containerHeightScaleFactor(1)}
                preloadAdditionalHeight={Infinite.containerHeightScaleFactor(1)}
                loadingSpinnerDelegate={this.renderSpinner()}
                isInfiniteLoading={this.state.isInfiniteLoading}
                useWindowAsScrollContainer={true}>
        {this.renderFacts()}
      </Infinite>
    );
  }
});
