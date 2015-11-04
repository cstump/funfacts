FF.FactList = React.createClass({
  propTypes: {
    facts: React.PropTypes.arrayOf(React.PropTypes.object).isRequired
  },

  renderFacts: function() {
    return this.props.facts.map(function(fact) {
      return <FF.Fact fact={fact} key={fact.id}/>;
    });
  },

  render: function() {
    return (
      <ul id="facts" className="list-group">
        {this.renderFacts()}
      </ul>
    );
  }
});
