Shader "Custom/ff2"
{
    Properties
    {
        _Color("Main Color", Color) = (1,1,1,1)
        _Ambient("Ambient", Color) = (0.3,0.3,0.3,0.3)
        _Specular("Specular", Color) = (1,1,1,1)
        _Shininess("Shininess", Range(0,8)) = 4.0
        _Emission("Emission", Color) = (1,1,1,1)
        _MainTex("MainTex", 2D)="white"{}
        _SecondTex("SecondTex", 2D)=""{}
        _Constant("Constant", Color) = (1,1,1,0.3)//透明度设置

    }
    SubShader
    {
        // inside SubShader
        Tags { "Queue"="Transparent" "RenderType"="Transparent" "IgnoreProjector"="True" }
        pass
        {
            // inside Pass
            ZWrite Off
            Blend SrcAlpha OneMinusSrcAlpha
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
            //设置主纹理
            settexture[_MainTex]
            {
                //primary代表了计算了顶点光照等的材质颜色
                combine texture * primary double
                
            }

            //设置第二个纹理
            settexture[_SecondTex]
            {
                constantColor[_Constant]
                ///previous代表前面计算了光照和合并贴图后的颜色
                combine texture * previous double, texture*constant 
                
            }
        }
    }
}
