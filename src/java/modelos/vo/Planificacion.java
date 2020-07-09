
package modelos.vo;

public class Planificacion {
    private int num;
    private int numdpto;
    private int numtaller;
    private int numtutor;
    private String fecha;
    // extras
    String nomarea;
    String nomdpto;
    String nomtaller;
    String nomtutor;

    public Planificacion() {
    }

    public Planificacion(int num, int numdpto, int numtaller, int numtutor, String fecha) {
        this.num = num;
        this.numdpto = numdpto;
        this.numtaller = numtaller;
        this.numtutor = numtutor;
        this.fecha = fecha;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getNumdpto() {
        return numdpto;
    }

    public void setNumdpto(int numdpto) {
        this.numdpto = numdpto;
    }

    public int getNumtaller() {
        return numtaller;
    }

    public void setNumtaller(int numtaller) {
        this.numtaller = numtaller;
    }

    public int getNumtutor() {
        return numtutor;
    }

    public void setNumtutor(int numtutor) {
        this.numtutor = numtutor;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNomarea() {
        return nomarea;
    }

    public void setNomarea(String nomarea) {
        this.nomarea = nomarea;
    }

    public String getNomdpto() {
        return nomdpto;
    }

    public void setNomdpto(String nomdpto) {
        this.nomdpto = nomdpto;
    }

    public String getNomtaller() {
        return nomtaller;
    }

    public void setNomtaller(String nomtaller) {
        this.nomtaller = nomtaller;
    }

    public String getNomtutor() {
        return nomtutor;
    }

    public void setNomtutor(String nomtutor) {
        this.nomtutor = nomtutor;
    }

    
}