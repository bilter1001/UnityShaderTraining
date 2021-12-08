Shader "Custom/ff1"
{
    Properties
    {
        _Color ("Main Color", Color) = (1,1,1,1)
        _Ambient("Ambient", Color) = (0.3,0.3,0.3,0.3)
        _Specular("Specular", Color) = (1,1,1,1)
        _Shininess("Shininess", Range(0,8))=4.0
        _Emission("Emission", Color) = (1,1,1,1)
    }
    SubShader
    {
        pass
        {
            //固定颜色为白色
            //color(1,1,1,1)

            //将_Color属性值赋给color，[]表示赋值
            //color[_Color]
            
            material
            {
                //漫反射颜色
                diffuse[_Color]
                //环境光
                ambient[_Ambient]
                //高光
                specular[_Specular]
                //光照范围
                shininess[_Shininess]
                //自发光
                emission[_Emission]
            }

            //打开光照
            lighting on
            //打开高光
            separatespecular on


        }
    }

}
