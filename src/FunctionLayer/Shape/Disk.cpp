#include "Disk.h"
#include "ResourceLayer/Factory.h"
bool Disk::rayIntersectShape(Ray &ray, int *primID, float *u, float *v) const {
    //* todo 完成光线与圆环的相交 填充primId,u,v.如果相交，更新光线的tFar
    //* 1.光线变换到局部空间
    Point3f origin = ray.origin; //光源点
    Vector3f direction = ray.direction;//方向向量

    vecmat::vec4f o{origin[0], origin[1], origin[2], 1.f},
        d{direction[0], direction[1], direction[2], 0.f};

    o = transform.invRotate * transform.invTranslate * o;
    d = transform.invRotate * transform.invTranslate * d;

    o /= o[3];
    origin = Point3f{o[0], o[1], o[2]};
    direction = Vector3f{d[0], d[1], d[2]};
    //* 2.判断局部光线的方向在z轴分量是否为0
    bool hit = false;
    if(direction[2] == 0){
        return hit;
    }
    //* 3.计算光线和平面交点
    float t = (0 - origin[2])/direction[2];
    if(t < ray.tNear || t > ray.tFar){
        return hit;
    }
    Point3f hit_point = origin + t*direction;
    //* 4.检验交点是否在圆环内
    // 半径检查
    float distanceSquared = hit_point[0]*hit_point[0] + hit_point[1]*hit_point[1];
    if(distanceSquared < innerRadius*innerRadius || distanceSquared > radius*radius){
        return hit;
    }
    // 角度检查
    float abs_phi = atan2(hit_point[1],hit_point[0]);
    float base = 0;
    float phi = 0;

    if(hit_point[0] >= 0 && hit_point[1] >= 0){
        // base = 0;
        // phi = base + abs_phi;
        phi = abs_phi;
    }
    else if(hit_point[0] <= 0 && hit_point[1] >= 0){
        // base = 0.5*PI;
        // phi = base + (0.5*PI - abs_phi);
        phi = abs_phi;
    }
    else if(hit_point[0] <= 0 && hit_point[1] <= 0){
        // base = PI;
        // phi = base + abs_phi;
        phi = 2*PI + abs_phi;
    }
    else if(hit_point[0] >= 0 && hit_point[1] <= 0){
        // base = 1.5*PI;
        // phi = base + (0.5*PI - abs_phi);
        phi = 2*PI + abs_phi;
    }

    if(phi > phiMax){
        return hit;
    } 
    //* 5.更新ray的tFar,减少光线和其他物体的相交计算次数
    ray.tFar = t;

    *primID = 0;
    *u = phi/phiMax;
    float distance = sqrt(distanceSquared);
    *v = (distance - innerRadius)/(radius - innerRadius);
    //* Write your code here.

    // hit = true;
    return true;
}

void Disk::fillIntersection(float distance, int primID, float u, float v, Intersection *intersection) const {
    /// ----------------------------------------------------
    //* todo 填充圆环相交信息中的法线以及相交位置信息

    //* 1.法线可以先计算出局部空间的法线，然后变换到世界空间
    // 计算法线
    Vector3f localNormal = Vector3f(0, 0, 1); // 圆环的法线垂直于平面
    Vector3f worldNormal = transform.toWorld(localNormal);
    intersection -> normal = normalize(worldNormal);

    //* 2.位置信息可以根据uv计算出，同样需要变换
    // 计算交点位置
    float rho = u*phiMax;
    float r = innerRadius + v*(radius - innerRadius);
    Point3f localHitPoint = Point3f(r*cos(rho), r*sin(rho), 0); // 根据 u 和 v 计算交点在局部空间的位置
    Point3f worldHitPoint = transform.toWorld(localHitPoint); // 将局部空间的位置转换为世界空间
    intersection -> position = worldHitPoint;
    //* Write your code here.





    /// ----------------------------------------------------


    intersection->shape = this;
    intersection->distance = distance;
    intersection->texCoord = Vector2f{u, v};
    Vector3f tangent{1.f, 0.f, .0f};
    Vector3f bitangent;
    if (std::abs(dot(tangent, intersection->normal)) > .9f) {
        tangent = Vector3f(.0f, 1.f, .0f);
    }
    bitangent = normalize(cross(tangent, intersection->normal));
    tangent = normalize(cross(intersection->normal, bitangent));
    intersection->tangent = tangent;
    intersection->bitangent = bitangent;
}

Disk::Disk(const Json &json) : Shape(json) {
//    normal = transform.toWorld(Vector3f(0,0,1));
//    origin = transform.toWorld(Point3f(0,0,0));
//    auto
//    //radius认为是三个方向的上的scale平均
//    vecmat::vec4f v(1,1,1,0);
//    auto radiusVec = transform.scale * v;
//    radiusVec/=radiusVec[3];
//    radius = (radiusVec[0]+radiusVec[1]+radiusVec[2])/3;
     radius = fetchOptional(json,"radius",1.f);
     innerRadius = fetchOptional(json,"inner_radius",0.f);
     phiMax = fetchOptional(json,"phi_max",2 * PI);
     AABB local(Point3f(-radius,-radius,0),Point3f(radius,radius,0));
     boundingBox = transform.toWorld(local);
}

void Disk::uniformSampleOnSurface(Vector2f sample, Intersection *result, float *pdf) const {
        //采样光源 暂时不用实现
}
REGISTER_CLASS(Disk, "disk")

