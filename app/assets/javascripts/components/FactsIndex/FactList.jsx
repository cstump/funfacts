FF.FactsIndex.FactList = React.createClass({
  propTypes: {
    facts: React.PropTypes.arrayOf(React.PropTypes.object).isRequired
  },

  renderFacts: function() {
    return this.props.facts.map(function(fact) {
      return (
        <div className="list-group-item" key={fact.id}>
          <FF.FactsIndex.Fact fact={fact}/>
        </div>
      );
    });
  },

  render: function() {
    return (
      <div id="facts" className="list-group">
        {this.renderFacts()}
      </div>
    );
  }
});
