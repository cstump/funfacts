FF.FactsIndex.Fact = React.createClass({
  propTypes: {
    fact: React.PropTypes.object.isRequired
  },

  renderSources: function() {
    return this.props.fact.datasets.map(function(dataset) {
      return <a key={dataset.id} href={dataset.uri} target="_blank">{dataset.name + ' dataset'}</a>;
    });
  },

  render: function() {
    return (
      <div>
        <article>
          <h2>{this.props.fact.heading}</h2>
          <p>{this.props.fact.body}</p>
        </article>
        <aside>
          <span>Source:</span>
          {this.renderSources()}
        </aside>
      </div>
    );
  }
});
