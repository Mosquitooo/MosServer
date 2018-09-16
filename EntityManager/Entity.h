

class Entity
{
public:
	Entity();
	~Entity();

public:
	void Create();

private:
	int m_EntityUID;
	EntityPart* m_Part[10];
};

