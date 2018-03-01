import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Still walking everywhere?", "JP Bikeshare is here."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
