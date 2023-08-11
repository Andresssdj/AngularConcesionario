if (keyOld == 'co' && jsonOld[keyOld] != null) {
          var jsqr = JSON.parse(JSON.stringify(value));
          if (jsqr.qrbco || jsqr.nequi) {
            value = "Activo cuentas";
          } else if (!jsqr.qrbco) {
            value = "Inactivo";
          }
        }
