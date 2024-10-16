package bd.pai_lab2;
import java.io.Serializable;

/**
 *
 * @author Emilia
 */
public class LoanBean implements Serializable {
    private double kwota = 1000;  // Kwota kredytu
    private double pr = 10;  // Roczne oprocentowanie
    private int n = 10;  // Liczba rat

    // Gettery i settery
    public double getKwota() {
        return kwota;
    }

    public void setKwota(double kwota) {
        this.kwota = kwota;
    }

    public double getPr() {
        return pr;
    }

    public void setPr(double pr) {
        this.pr = pr;
    }

    public int getN() {
        return n;
    }

    public void setN(int n) {
        this.n = n;
    }

    // Metoda obliczająca miesięczną ratę kredytu
    public double getRata() {
        // Miesięczna stopa oprocentowania
        double r = (pr / 100) / 12;

        // Wzór na obliczenie raty kredytu
        double rata = (kwota * r * Math.pow(1 + r, n)) / (Math.pow(1 + r, n) - 1);

        return rata;  // Zwraca obliczoną ratę kredytu
    }
}
