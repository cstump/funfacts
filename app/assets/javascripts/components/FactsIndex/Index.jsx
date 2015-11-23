FF.FactsIndex.Index = React.createClass({
  propTypes: {
    regionPath: React.PropTypes.string.isRequired,
    headingLink: React.PropTypes.string.isRequired,
    aboutLink: React.PropTypes.string.isRequired,
    suggestLink: React.PropTypes.string.isRequired,
    facts: React.PropTypes.arrayOf(React.PropTypes.object).isRequired
  },

  renderTopNav: function() {
    return <FF.FactsIndex.TopNav regionPath={this.props.regionPath}
                                 headingLink={this.props.headingLink}
                                 aboutLink={this.props.aboutLink}
                                 suggestLink={this.props.suggestLink}/>;
  },

  renderFactsList: function() {
    return <FF.FactsIndex.FactList facts={this.props.facts}/>;
  },

  render: function() {
    return (
      <div>
        {this.renderTopNav()}
        <div className="container">
          {this.renderFactsList()}
        </div>
      </div>
    );
  }
})
