package beans;

public class Imagen {

  private String ruta, nombre;
  private float tamanio;

  public Imagen(String ruta, String nombre, float tamanio) {
    this.ruta = ruta;
    this.nombre = nombre;
    this.tamanio = tamanio;
  }

  public String tamanioDesglosado(){
      String result = "";
      int bytes = (int) (tamanio%1024);
      result = bytes + " bytes ";
      if (tamanio > 1024) {
          int Kb = (int) (tamanio / 1024 % 1024);
          result = Kb + " Kb " + result;
      }
      if (tamanio>(1024*1024)) {
          int Mb = (int) (tamanio / 1024 / 1024 % 1024);
          result = Mb + " Mb " + result;
      }
      return result;
  }

  public String getRuta() {
    return ruta;
  }

  public String getNombre() {
    return nombre;
  }
}
