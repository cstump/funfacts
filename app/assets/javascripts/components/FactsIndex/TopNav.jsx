(function() {
  var Button = React.createClass({
    render: function () {
      return (
        <button className="navbar-toggle" type="button" data-toggle="collapse" data-target="#ff-navbar-collapse">
          <span className="icon-bar"/>
          <span className="icon-bar"/>
          <span className="icon-bar"/>
        </button>
      );
    }
  });

  var Heading = React.createClass({
    render: function () {
      return (
        <h1 id="heading">
          <a href={this.props.regionPath}>{this.props.headingLink}</a>
        </h1>
      );
    }
  });

  var RightMenu = React.createClass({
    render: function () {
      return (
        <ul className="nav navbar-nav navbar-right">
          <li><a href={this.props.regionPath}>{this.props.aboutLink}</a></li>
          <li><a href={this.props.regionPath}>{this.props.suggestLink}</a></li>
        </ul>
      );
    }
  });

  FF.FactsIndex.TopNav = React.createClass({
    propTypes: {
      regionPath: React.PropTypes.string.isRequired,
      headingLink: React.PropTypes.string.isRequired,
      aboutLink: React.PropTypes.string.isRequired,
      suggestLink: React.PropTypes.string.isRequired
    },

    render: function () {
      return (
        <nav id="top-nav" className="navbar navbar-default navbar-fixed-top" role="navigation">
          <div className="container">
            <div className="navbar-header">
              <Button/>
              <Heading regionPath={this.props.regionPath}
                       headingLink={this.props.headingLink}/>
            </div>
            <div id="ff-navbar-collapse" className="collapse navbar-collapse">
              <RightMenu regionPath={this.props.regionPath}
                         aboutLink={this.props.aboutLink}
                         suggestLink={this.props.suggestLink}/>
            </div>
          </div>
        </nav>
      );
    }
  });
})();
