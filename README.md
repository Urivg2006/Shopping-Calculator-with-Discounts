**Català:**

# Calculadora de Compres amb Descomptes

## Creeu una aplicació amb Flutter que mostri:
* **Dues caixes de text (TextField):**
    * Una per introduir el **nombre d’unitats** comprades.
    * Una per introduir el **preu d’una unitat**.
* **Dos botons:**
    * **Acumular:** suma al total acumulat el resultat de `unitats × preu`.
    * **Total:** mostra el total acumulat fins al moment, aplicant un descompte.

## Funcionament de l'aplicació:
L’aplicació ha de mostrar clarament a l'usuari:
1.  El **total parcial** després de cada producte afegit (botó Acumular).
2.  El **total final** (botó Total) mostrant:
    * L'import brut.
    * El descompte aplicat.
    * L'import final a pagar.
3.  **Reinici:** Després de mostrar el total final, el programa ha de reiniciar el total acumulat a 0, preparant-se per a una nova compra.

## Taula de Descomptes:
El descompte s'aplica segons el total acumulat:
* Fins a **50 €** → 0 %
* De **50 a 99,99 €** → 5 %
* De **100 a 199,99 €** → 10 %
* **200 €** o més → 15 %

## Afegir estils (Fitxers):
* Creeu un fitxer anomenat `estils.dart`.
* Apliqueu **5 estils** al `main.dart` importats des del fitxer d'estils.

---

## 📜 Llicència
Aquest projecte està sota la llicència **GNU GPLv3**. Aquest és programari lliure i teniu la llibertat d'executar-lo, estudiar-lo, modificar-lo i distribuir-lo. Consulta el fitxer [LICENSE](LICENSE) per a més detalls.

---

> **⚠️PD:** Els HTML estan fets originalment fets en català però he ficat comentaris de la traducció

---

**English:**

# Shopping Calculator with Discounts

## Create a Flutter application that displays:
* **Two Text Boxes (TextField):**
    * One to enter the **number of units** purchased.
    * One to enter the **price per unit**.
* **Two Buttons:**
    * **Accumulate:** adds the result of `units × price` to the accumulated total.
    * **Total:** shows the accumulated total so far, applying a discount.

## Application Logic:
The application must clearly show the user:
1.  The **partial total** after each product is added (Accumulate button).
2.  The **final total** (Total button) showing:
    * The gross amount.
    * The discount applied.
    * The final amount to pay.
3.  **Reset:** After showing the final total, the program must reset the accumulated total to 0, preparing for a new purchase.

## Discount Table:
The discount is applied based on the accumulated total:
* Up to **50 €** → 0%
* From **50 to 99.99 €** → 5%
* From **100 to 199.99 €** → 10%
* **200 €** or more → 15%

## Add Styles (Files):
* Create a file named `styles.dart`.
* Apply **5 styles** in `main.dart` imported from the styles file.

---

## 📜 License
This project is released under the **GNU GPLv3** license. This is free software, and you are free to run, study, change, and distribute it. See the [LICENSE](LICENSE) file for details.

---

> **⚠️PD:** The HTML files were originally written in Catalan, but I have included comments with the English translations for better understanding.
