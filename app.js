/*jshint esversion: 8 */
/* jshint expr: true */

const body = document.querySelector(".body");
const light = document.querySelector("#light");
const dark = document.querySelector("#dark");
const dropBtn = document.querySelector(".dropbtn");
const dropDown = document.querySelector("#myDropdown");
const mainContainer = document.querySelector(".main-container");
const searchFilterContainer = document.querySelector(".search-filter");
const viewSection = document.querySelector(".view-section");
const input = document.querySelector(".search");

dark.addEventListener("click", () => {
  body.classList.add("body-dark");
  light.style.display = "flex";
  dark.style.display = "none";
});
light.addEventListener("click", () => {
  body.classList.remove("body-dark");
  light.style.display = "none";
  dark.style.display = "flex";
});

dropBtn.addEventListener("click", () => {
  dropDown.classList.toggle("show");
});

window.addEventListener("click", (event) => {
  if (!event.target.matches(".dropbtn")) {
    let dropdowns = document.getElementsByClassName("dropdown-content");
    let i;
    for (i = 0; i < dropdowns.length; i++) {
      let openDropdown = dropdowns[i];
      if (openDropdown.classList.contains("show")) {
        openDropdown.classList.remove("show");
      }
    }
  }
});
const getSpecificCountries = async (name) => {
  const url = fetch(`
  https://restcountries.com/v3.1/name/${name}?fullText=true`);
  try {
    const resp = await url;
    const data = await resp.json();
    console.log(data);
    const specificCountries = data.map((items) => {
      const name = items.name.common;
      const nativeName = items.name.nativeName;
      function getNativeName() {
        for (const property in nativeName) {
          const hello = nativeName[property];
          for (const key in hello) {
            const element = hello[key];
            return element;
          }
        }
      }
      const flag = items.flags.png;
      const population = items.population.toLocaleString();
      const region = items.region;
      const subRegion = items.subregion;
      const capital = items.capital;
      const topLevelDomain = items.tld[0];
      const currency = items.currencies;
      const borders = items.borders;

      let txtBorder = "";
      if (borders == null) {
        txtBorder += `<p class="no-border"> ${name} has no borders </p>`;
      } else {
        for (let i = 0; i < borders.length; i++) {
          const element = borders[i];
          txtBorder += `<button class="contain"> ${element} </button>`;
        }
      }

      function getCurrency() {
        for (const property in currency) {
          const hello = currency[property].name;
          return hello;
        }
      }
      const languages = items.languages;
      let txt = "";
      for (const property in languages) {
        txt += languages[property] + " ";
      }
      let results = "";
      results += ` <div class="view-img-container">
      <button class="back"><i class="fas fa-arrow-left"></i>Back</button>
      <img
        src="${flag}"
        alt=""
      />
    </div>

    <div class="view-text-container">
      <div class="title">
        <h2>${name}</h2>
      </div>

      <div class="second-first-text">
        <div class="first">
          <p><span>Native Name:</span> ${getNativeName()}</p>
          <p><span>Population:</span> ${population}</p>
          <p><span>Region:</span> ${region}</p>
          <p><span>Sub Region:</span> ${subRegion}</p>
          <p><span>Capital:</span> ${capital}</p>
          <div class="border"><p class="borders-txt">Borders: </p> ${txtBorder} </div> 
        </div>

        <div class="second">
          <p><span>Top Level Domain:</span> ${topLevelDomain}</p>
          <p><span>Currenices:</span> ${getCurrency()}</p>
          <p><span>Languages:</span> ${txt}</p>
        </div>
      </div>
    </div>`;
      viewSection.style.display = "flex";
      viewSection.innerHTML = results;
      const back = document.querySelector(".back");
      back.addEventListener("click", () => {
        mainContainer.style.display = "flex";
        searchFilterContainer.style.display = "flex";
        viewSection.style.display = "none";
      });
    });
    return specificCountries;
  } catch (error) {
    console.log("error");
  }
};
const ldsRing = document.querySelector(".lds-ring");
function displayLoading() {
  setTimeout(() => {
    ldsRing.style.display = "none";
  }, 5000);
}

function hideLoading() {
  const ldsRing = document.querySelector(".lds-ring");
  ldsRing.style.display = "none";
}

const getCountries = async () => {
  displayLoading();
  const url = fetch(`https://restcountries.com/v3.1/all`);
  try {
    const resp = await url;
    const data = await resp.json();
    const countries = data.map((items) => {
      const name = items.name.common;
      const flag = items.flags.png;
      const population = items.population.toLocaleString();
      const region = items.region;
      const capital = items.capital;
      let results = "";
      results += `<div class="box">
      <div class="img-box">
        <img
          src="${flag}"
          alt=""
        />
      </div>
      <div class="text-box">
        <h2>${name}</h2>
        <p><span>Population:</span> ${population}</p>
        <p><span>Region:</span> ${region}</p>
        <p><span>Capital:</span> ${capital}</p>
      </div>
    </div>`;
      hideLoading();
      mainContainer.innerHTML += results;
    });
    const imageBox = [...document.querySelectorAll(".img-box")];
    const viewMoreInfo = () => {
      imageBox.forEach((button) => {
        button.addEventListener("click", (btn) => {
          let specificCountry =
            btn.target.parentElement.nextElementSibling.firstElementChild
              .innerHTML;
          mainContainer.style.display = "none";
          searchFilterContainer.style.display = "none";
          getSpecificCountries(specificCountry);
        });
      });
    };
    viewMoreInfo();
    const filterBtns = document.querySelectorAll(".filter");
    const box = document.querySelectorAll(".box");

    filterBtns.forEach((buttons) => {
      buttons.addEventListener("click", (e) => {
        const filters = e.target.dataset.filter;
        box.forEach((product) => {
          let element =
            product.firstElementChild.nextElementSibling.firstElementChild
              .nextElementSibling.nextElementSibling.textContent;
          if (filters.toLowerCase() == "all") {
            product.style.display = "flex";
          } else {
            if (element.toLowerCase() == `region: ${filters.toLowerCase()}`) {
              product.style.display = "flex";
            } else {
              product.style.display = "none";
            }
          }
        });
      });
    });
    input.addEventListener("keyup", () => {
      let filterValue = input.value.toUpperCase();
      for (let i = 0; i < box.length; i++) {
        let element =
          box[i].firstElementChild.nextElementSibling.firstElementChild;
        if (element.innerHTML.toUpperCase().indexOf(filterValue) > -1) {
          box[i].style.display = "";
        } else {
          box[i].style.display = "none";
        }
      }
    });
    return countries;
  } catch (error) {
    console.log("error");
  }
};

window.addEventListener("DOMContentLoaded", () => {
  getCountries();
});
