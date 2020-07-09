
package modelos.vo;

public class Dpto {
    private int num;
    private String nombre;
    private int numarea;

    public Dpto() {
    }

    public Dpto(int num, String nombre, int numarea) {
        this.num = num;
        this.nombre = nombre;
        this.numarea = numarea;
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

    public int getNumarea() {
        return numarea;
    }

    public void setNumarea(int numarea) {
        this.numarea = numarea;
    }
    
    
}
