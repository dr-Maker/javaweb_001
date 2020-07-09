
package modelos.vo;

public class Taller {
    private int num;
    private String nombre;
    private int horas;
    private int cupos;

    public Taller() {
    }

    public Taller(int num, String nombre, int horas, int cupos) {
        this.num = num;
        this.nombre = nombre;
        this.horas = horas;
        this.cupos = cupos;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getHoras() {
        return horas;
    }

    public void setHoras(int horas) {
        this.horas = horas;
    }

    public int getCupos() {
        return cupos;
    }

    public void setCupos(int cupos) {
        this.cupos = cupos;
    }
    
    
}
