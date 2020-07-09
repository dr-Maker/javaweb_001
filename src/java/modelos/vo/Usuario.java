
package modelos.vo;

public class Usuario {
    private int num;
    private String usuario;
    private String clave;

    public Usuario() {
    }

    public Usuario(int num, String usuario, String clave) {
        this.num = num;
        this.usuario = usuario;
        this.clave = clave;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    
    
}
