// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unity Shaders Book/Chapter 5/Simple Shader"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // 使用一个结构体来定义定点着色器的输入
            struct a2v
            {
                // POSITION (CG/HLSL)语义告诉UNity,用模型空间的定点坐标填充verter变量
                float4 vertex : POSITION;
                // NORMAL语义告诉Unity，用模型空间的发现防线填充normal变量
                float3 normal : NORMAL;
                // TEXCOORD0 语义告诉Unity,用模型的第一套纹理坐标填充texcoord变量
                float4 texcoord : TEXCOORD;
            };
            
            struct v2f
            {
                // SV_POSITION语义告诉Unity，pos包含了顶点在裁剪空间中额位置信息
                float4 pos : SV_POSITION;
                // COLOR0语义可以用于存储颜色信息。
                fixed3 color : COLOR0;
            };

            float4 vert (a2v v) : SV_POSITION
            {
                //使用v.vertex来访问模型空间的顶点坐标
                return UnityObjectToClipPos (v.vertex);
            }

            fixed4 frag () : SV_Target
            {
                return fixed4(1.0,1.0,1.0,1.0);
            }
            ENDCG
        }
    }
}
