import { Send } from "@mui/icons-material";
import { Box, Button, Tab, Tabs, TextField } from "@mui/material";
import axios from "axios";
import { useEffect, useState } from "react";
import Primaryheader from "../../components/ui/header/primaryheader";
import "./dashboard.css";

export default function Dashboard() {
  const [tables, setTables] = useState({}); // Stores multiple tables
  const [updatedContent, setUpdatedContent] = useState({});
  const [tabIndex, setTabIndex] = useState(0); // Track selected tab

  // Fetch initial content
  useEffect(() => {
    axios
      .get(process.env.PUBLIC_URL + "/assets/fpdata.json")
      .then((res) => {
        setTables(res.data);

        // Initialize updatedContent for each table
        const initialData = {};
        Object.keys(res.data).forEach((tableKey) => {
          res.data[tableKey].forEach((item) => {
            initialData[item.id] = item.content;
          });
        });
        setUpdatedContent(initialData);
      })
      .catch((err) => console.error("Error fetching data:", err));
  }, []);

  const handleChange = (id, newValue) => {
    setUpdatedContent({ ...updatedContent, [id]: newValue });
  };

  const handleUpdate = async (id, tableName) => {
    console.log(`Updating tableName: ${tableName} ID: ${id} with content:`, updatedContent[id]);

    // In a real scenario, you would send this to a backend API
    // axios.put(`/api/update-content/${id}`, { content: updatedContent[id] })
    //   .then(() => alert("Content updated successfully!"))
    //   .catch(() => alert("Failed to update content."));

    try {
      const response = await axios.put(`http://localhost:5000/api/update-content/${tableName}`, {
        id: id,
        content: updatedContent[id] // Send the content for the specific ID
      }); // Adjust API route
      alert("Content updated successfully!");
    } catch (err) {
      console.error("Error updating content:", err);
      alert("Failed to update content.");
    }
  };

  const tableKeys = Object.keys(tables); // Extract table names

  return (
    <div className="dashboard">
      <Primaryheader
        headerImage={""}
        imageAlt={"Dashboard"}
        headerText={"Admin Dashboard"}
      />
      <Box sx={{ borderBottom: 1, borderColor: "divider" }}>
        <Tabs
          value={tabIndex}
          onChange={(e, newValue) => setTabIndex(newValue)}
          aria-label="Dynamic Table Tabs"
        >
          {tableKeys.map((tableName, index) => (
            <Tab key={index} label={tableName} />
          ))}
        </Tabs>
      </Box>
      {tableKeys.length > 0 && tables[tableKeys[tabIndex]] && (
        <div className="page-content">
          {tables[tableKeys[tabIndex]].filter((item) => item.target !== "").map((item) => (
            <div key={item.id} className="item-container">
              <h3>{item.title}</h3>
              <TextField
                multiline
                minRows={3}
                maxRows={4}
                value={updatedContent[item.id] || ""}
                onChange={(e) => handleChange(item.id, e.target.value)}
              />
              <Button
                onClick={() => handleUpdate(item.id, tableKeys[tabIndex] )}
                variant="contained"
                endIcon={<Send />}
              >
                Update
              </Button>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
