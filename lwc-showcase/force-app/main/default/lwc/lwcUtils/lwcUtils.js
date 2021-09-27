import { ShowToastEvent } from "lightning/platformShowToastEvent";

function showToast(cmp, msg, title, variant) {
  const event = new ShowToastEvent({
    title: title,
    message: msg,
    variant: variant,
    mode: "dismissable"
  });
  cmp.dispatchEvent(event);
}

function reloadPage() {
  setTimeout(
    function () {
      window.location.reload();
    }.bind(this),
    500
  );
}

export { showToast, reloadPage };