import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Search your pick up location", "Rent a bike"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
