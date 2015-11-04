FF.Fact = React.createClass({
  propTypes: {
    fact: React.PropTypes.object.isRequired
  },

  renderSources: function() {
    return this.props.fact.datasets.map(function(dataset) {
      return (
        <li key={dataset.id}>
          <a href={dataset.uri} target="_blank">{dataset.name + ' dataset'}</a>
        </li>
      );
    });
  },

  render: function() {
    return (
      <li className="list-group-item">
        <article>
          <h2>{this.props.fact.heading}</h2>
          <p>{this.props.fact.body}</p>
        </article>
        <aside>
          <span>Source: </span>
          <ul>{this.renderSources()}</ul>
        </aside>
      </li>
    );
  }
});
