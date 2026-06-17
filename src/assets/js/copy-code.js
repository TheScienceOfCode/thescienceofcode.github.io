(function () {
  "use strict";

  function initCopyButtons() {
    const blocks = document.querySelectorAll(
      ".content .highlight, .content pre",
    );

    blocks.forEach((block) => {
      if (block.dataset.copyReady === "true") return;
      block.dataset.copyReady = "true";

      const code = block.querySelector("code");
      if (!code) return;

      const button = document.createElement("button");
      button.type = "button";
      button.className = "tsoc-code-copy";
      button.textContent = "Copy";
      button.setAttribute("aria-label", "Copy code");

      button.addEventListener("click", async () => {
        const text = code.innerText.replace(/\n$/, "");

        try {
          await navigator.clipboard.writeText(text);
          button.textContent = "Copied";
          window.setTimeout(() => {
            button.textContent = "Copy";
          }, 1400);
        } catch (_error) {
          button.textContent = "Error";
          window.setTimeout(() => {
            button.textContent = "Copy";
          }, 1400);
        }
      });

      block.appendChild(button);
    });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initCopyButtons);
  } else {
    initCopyButtons();
  }
})();
