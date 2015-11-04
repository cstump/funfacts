FF.FactsIndex.TopNav = React.createClass({
  propTypes: {
    regionPath: React.PropTypes.string.isRequired,
    headingLink: React.PropTypes.string.isRequired,
    aboutLink: React.PropTypes.string.isRequired,
    suggestLink: React.PropTypes.string.isRequired
  },

  renderButton: function() {
    return (
      <button className="navbar-toggle" type="button" data-toggle="collapse" data-target="#ff-navbar-collapse">
        <span className="icon-bar"/>
        <span className="icon-bar"/>
        <span className="icon-bar"/>
      </button>
    );
  },

  renderHeading: function() {
    return (
      <h1 id="heading">
        <a href={this.props.regionPath}>{this.props.headingLink}</a>
      </h1>
    );
  },

  renderRightMenu: function() {
    return (
      <ul className="nav navbar-nav navbar-right">
        <li><a href={this.props.regionPath}>{this.props.aboutLink}</a></li>
        <li><a href={this.props.regionPath}>{this.props.suggestLink}</a></li>
      </ul>
    );
  },

  render: function() {
    return (
      <nav id="top-nav" className="navbar navbar-default navbar-fixed-top" role="navigation">
        <div className="container">
          <div className="navbar-header">
            {this.renderButton()}
            {this.renderHeading()}
          </div>
          <div id="ff-navbar-collapse" className="collapse navbar-collapse">
            {this.renderRightMenu()}
          </div>
        </div>
      </nav>
    );
  }
});
