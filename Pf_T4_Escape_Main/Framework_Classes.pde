//***********************************************
//*       Saxion First Contact Project          *
//*              ECM1V.Pf_Team_4                *
//*               version 0.01                  *
//*            authors Soma, Marvin             *
//*                                             *
//***********************************************

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
            if (mouseX >= i.position.x - i.size.x/2 && mouseX <= i.position.x + i.size.x/2){
                if (mouseY >= i.position.y - i.size.y/2 && mouseY <= i.position.y + i.size.y/2){
                    i.Clicked();
                }
            }
        }
    }

}

class GameObject{
    public PVector position = new PVector(0,0);
    public PVector size = new PVector(0,0);
    private PImage texture;
    private PVector texture_size = new PVector(0,0);

    public void Update(){

        if (texture != null){
            imageMode(CENTER);
            if (texture_size.y == 0 || texture_size.y == 0){
                image(texture, position.x, position.y);
            }
            else{
                image(texture, position.x, position.y, texture_size.x, texture_size.y);
            }
        }
        
        if (debug){
            fill(0, 0, 255, 50);
            noStroke();
            rect(position.x - size.x/2, position.y - size.y/2, size.x, size.y);
        }

    }

    public void Clicked(){
    }

    public GameObject(int pos_x, int pos_y, int size_x, int size_y){
        position.x = pos_x;
        position.y = pos_y;
        size.x = size_x;
        size.y = size_y;
    }

    public void SetTexture(String image_path){
        texture = loadImage(image_path);
    }
    public void SetTexture(String image_path, int size_x, int size_y){
        texture = loadImage(image_path);
        texture_size.x = size_x;
        texture_size.y = size_y;
    }

}

class SceneChanger extends GameObject{
    public String target_scene;

    public SceneChanger(String target_scene, int pos_x, int pos_y, int size_x, int size_y){
        super(pos_x, pos_y, size_x, size_y);
        this.target_scene = target_scene;
    }

    @Override
    public void Clicked(){
        scene_manager.ChangeScene(target_scene);
    }

}

class Collectable extends GameObject{
    public Collectable(int pos_x, int pos_y, int size_x, int size_y){
        super(pos_x, pos_y, size_x, size_y);
    }

    @Override
    public void Clicked(){
        
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

