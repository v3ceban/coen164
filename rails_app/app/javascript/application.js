// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("turbo:load", () => {
  const notification = document.querySelector(".notice");

  if (notification) {
    let opacity = 1;
    let interval;

    const fadeOut = () => {
      interval = setInterval(() => {
        if (opacity > 0) {
          notification.style.opacity = opacity;
          opacity -= 0.015;
        } else {
          clearInterval(interval);
          notification.style.display = "none";
        }
      }, 50);
    };

    const resetFadeOut = () => {
      clearInterval(interval);
      notification.style.opacity = 1;
    };

    notification.addEventListener("mouseover", resetFadeOut);

    notification.addEventListener("mouseout", () => {
      opacity = 1;
      fadeOut();
    });

    fadeOut();
  }
});
