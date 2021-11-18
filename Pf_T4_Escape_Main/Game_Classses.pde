//***********************************************
//*       Saxion First Contact Project          *
//*              ECM1V.Pf_Team_4                *
//*               version 0.005                 *
//*            authors Soma, Marvin             *
//*                                             *
//***********************************************

class Tube extends GameObject{
    PImage crack;
    public Tube(String name, int pos_x, int pos_y, int size_x, int size_y){
        super(name, pos_x, pos_y, size_x, size_y);
        crack = loadImage("Assets/crack.png");
    }

    @Override
    public void Clicked(){
        texture = crack;
        texture_size.x = 120;
        texture_size.y = 120;
        conditions.put("is_tube_broken", true);
    }
}
