import React from 'react';
import "bootstrap/dist/css/bootstrap.min.css";
import "../styles/NavBar.css";

const NavBar = () => {
    return (
        <nav className="navbar navbar-expand-sm bg-body-tertiary">
  <div className="container-fluid">
    <a className="navbar-brand" href="#">Dash</a>
    <button className="navbar-toggler text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#dashnav" aria-controls="dashnav" aria-expanded="false" aria-label="Toggle navigation">
    <i id="bars" className="fa-solid fa-bars fa-sm"></i> 
    </button>
    <div className="collapse navbar-collapse" id="dashnav">
      <ul className="navbar-nav me-auto mb-2 mb-lg-0">
        <li className="nav-item">
          <a className="nav-link active text-primary" aria-current="page" href="#">Exensions</a>
        </li>
        <li className="nav-item">
          <a className="nav-link text-primary" href="#">Apps</a>
        </li>
        <li className="nav-item">
          <a className="nav-link text-primary" href="#">Assets</a>
        </li>
        <li className="nav-item">
          <a className="nav-link text-primary" href="#">Team</a>
        </li>
        <li className="nav-item">
          <a className="nav-link text-primary" href="#">Administration</a>
        </li>
        
          
      </ul>
      <form className="d-flex" role="search">
        <input className="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
        <i class="fa-solid fa-magnifying-glass"></i>
        
      </form>
    </div>
  </div>
</nav>
    );
};

export default NavBar;