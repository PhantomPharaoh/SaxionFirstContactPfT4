class Scene{
    public String name;
    public ArrayList<GameObject> objects = new ArrayList<GameObject>();

    public Scene(String name){
        this.name = name;
    }

}

class GameObject{
    public String name;
    public PVector position;
}

class Sprite extends GameObject{
    private PImage texture;
    private PVector size;
    
    public Sprite(String name, PVector position, String texture_path, PVector size){
        this.name = name;
        this.position = position;
        this.texture = loadImage(texture_path);
        this.size = size;
    }

}

