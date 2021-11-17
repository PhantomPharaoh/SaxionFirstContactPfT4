import java.util.HashMap;

class Scene{
    public String name;
    public ArrayList<GameObject> objects = new ArrayList<GameObject>();

    public Scene(String name){
        this.name = name;
    }

    public void Update(){
        for (GameObject i : objects) {
            i.Update();
        }
    }

    public void Clicked(){
        for (GameObject i : objects) {
            i.Clicked();
        }
    }

}

class GameObject{
    public PVector position = new PVector(0,0);
    private PImage texture;

    public void Update(){
        imageMode(CENTER);
        image(texture, position.x, position.y);
    }

    public void Clicked(){
    }

    public GameObject(int pos_x, int pos_y, String texture_path){
        position.x = pos_x;
        position.y = pos_y;
        this.texture = loadImage(texture_path);
    }

}

class SceneChanger extends GameObject{
    public String target_scene;

    public SceneChanger(String target_scene, int pos_x, int pos_y, String texture_path){
        super(pos_x, pos_y, texture_path);
        this.target_scene = target_scene;
    }

    @Override
    public void Clicked(){
        if (mouseX > position.x - 50 && mouseX < position.x + 50){
            if (mouseY > position.y - 50 && mouseY < position.y + 50){
                scene_manager.ChangeScene(target_scene);
            }
        }
    }

}

class SceneManager{
    private HashMap<String, Scene> scenes;
    private String current_scene_name = "";

    public SceneManager(){
        scenes = new HashMap<String, Scene>();
    }

    public void ChangeScene(String target_scene_name){
        if (scenes.containsKey(target_scene_name)){
            current_scene_name = target_scene_name;
        }
        else{
            println(target_scene_name + " scene not found");
        }
    }

    public Scene GetCurrentScene(){
        return scenes.get(current_scene_name);
    }

    public void AddScene(Scene s){
        scenes.put(s.name, s);
        if (current_scene_name == ""){
            current_scene_name = s.name;
        }
    }

}

