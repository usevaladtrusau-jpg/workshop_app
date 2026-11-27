/* eslint-disable @typescript-eslint/no-unnecessary-type-assertion */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */
/* eslint-disable @typescript-eslint/no-redundant-type-constituents */
import ExtensionAPI from "sap/fe/templates/ListReport/ExtensionAPI";
import Context from "sap/ui/model/odata/v4/Context";
import MessageToast from "sap/m/MessageToast";
import Dialog from "sap/m/Dialog";
import Input from "sap/m/Input";
import Fragment from "sap/ui/core/Fragment";
import View from "sap/ui/core/mvc/View";

/**
 * Generated event handler.
 *
 * @param this reference to the 'this' that the event handler is bound to.
 * @param context the context of the page on which the event was fired. `undefined` for list report page.
 * @param selectedContexts the selected contexts of the table rows.
 */

type InputIdsType = {
    initSeatNumber: string,
    finalSeatNumber: string,
    excludeSeatNumbers: string
}

function resetValues(this: ExtensionAPI, inputIds: InputIdsType ): void {
  const oView = (this as unknown as { _view: View })._view;
  const sFragmentId = oView.getId();
  (
    Fragment.byId(sFragmentId, inputIds.initSeatNumber) as Input | undefined
  ).setValue("");
  (
    Fragment.byId(sFragmentId, inputIds.finalSeatNumber) as Input | undefined
  ).setValue("");
  (
    Fragment.byId(sFragmentId, inputIds.excludeSeatNumbers) as Input | undefined
  ).setValue("");
}

export async function handleFillAircraftSeats(
  this: ExtensionAPI,
  context: Context | undefined,
  selectedContexts: Context[]
): Promise<void> {
  const InputIds: InputIdsType = {
    initSeatNumber: "initSeatNumber",
    finalSeatNumber: "finalSeatNumber",
    excludeSeatNumbers: "excludeSeatNumbers"
  };
  const oView = (this as unknown as { _view: View })._view;
  const sFragmentId = oView.getId();

  // Reuse existing dialog instance if already loaded, otherwise load it
  let oDialog = Fragment.byId(sFragmentId, "seatsModal") as Dialog | undefined;

  if (!oDialog) {
    oDialog = (await this.loadFragment({
      id: sFragmentId,
      name: "aircrafts.ext.fragments.ModalDialog",
      controller: {
        onConfirmModal: () => {
          const seatInitValue = (
            Fragment.byId(sFragmentId, InputIds.initSeatNumber) as Input
          ).getValue();
          const seatFinalValue = (
            Fragment.byId(sFragmentId, InputIds.finalSeatNumber) as Input
          ).getValue();
          const excludeNumbersValue = (
            Fragment.byId(sFragmentId, InputIds.excludeSeatNumbers) as Input
          ).getValue();

          MessageToast.show(
            `Entered value: seatInitValue:${seatInitValue}| seatFinalValue:${seatFinalValue}| excludeNumbersValue:${excludeNumbersValue}
            (Selected rows: ${selectedContexts.length})`
          );

          // eslint-disable-next-line @typescript-eslint/no-unused-vars
          const input = {
            seatInitNum: seatInitValue,
            seatFinalNum: seatFinalValue,
            excludeNumbers: excludeNumbersValue
          };

          oDialog?.close();
        },
        onCloseModal: () => {
          oDialog?.close();
        }
      }
    })) as Dialog;
  }

  resetValues(this, InputIds);

  oDialog.open();
}
