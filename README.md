[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/lukaskln/Optim-Visualization">
    <img src="https://github.com/lukaskln/Optim-Visualization/blob/master/Graphics/Bivariate.png" alt="Logo" width="500">
  </a>

  <h3 align="center">Visualization of Optimization</h3>

  <p align="center">
    Uni- and Bivariate Optimization Traces in Julia.
    <br />
    <a href="https://github.com/lukaskln/Optim-Visualization"><strong>Explore the Project »</strong></a>
    <br />
    <br />
    <a href="https://github.com/lukaskln/Optim-Visualization/issues">Report Bug</a>
  </p>
</p>

## About the Project

Julia is an efficient language for numerical optimization. To better understand how different optimization 
algorithm work and how they converge this small project visualizes the optimization paths of gradient based methods and Simulated
Annealing for almost any uni- and bivariate function.

## The Code 

The code is seperated into two scripts: one for univariate and one for bivariate functions. The code uses the *optim* packages and the *gr* visualization 
backend. Before running the script the function, maximum iterations and the starting position have to be set. Note, that Simulated Annealing is a heuristic 
method and outcomes can change if the seed is not fixed.  

## Contact

Lukas Klein - [LinkedIn](https://www.linkedin.com/in/lukasklein1/) - lukas.klein@etu.unige.ch

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/lukaskln/Optim-Visualization/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/lukasklein1/
