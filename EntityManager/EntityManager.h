

class EntityManager
{
public:
	EntityServer();
	~EntityServer();

public:
	void OnMessage();

private:
	std::map<int, Entity*> m_EntityList;
};

